defmodule HighSchoolSweetheart do
  def first_letter(name) do
    name |> String.trim() |> String.at(0)
  end

  def initial(name) do
    name |> first_letter() |> String.upcase() |> Kernel.<>(".")
  end

  def initials(full_name) do
    full_name |> String.trim() |> String.split() |> Stream.map(&initial/1) |> Enum.join(" ")
  end

  def pair(full_name1, full_name2) do
    xy = initials(full_name1)
    xx = initials(full_name2)

    """
         ******       ******
       **      **   **      **
     **         ** **         **
    **            *            **
    **                         **
    **     #{xy}  +  #{xx}     **
     **                       **
       **                   **
         **               **
           **           **
             **       **
               **   **
                 ***
                  *
    """
  end
end