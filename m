From: Nicholas Piggin <npiggin@gmail.com>
Date: Tue, 16 Apr 2024 14:35:23 +1000
Subject: [RFC kvm-unit-tests PATCH v2 01/14] Add initial shellcheck
 checking
In-Reply-To: <27ba7613-1344-40b8-bc4d-9a9903ebdcfa@redhat.com>
References: <20240406123833.406488-1-npiggin@gmail.com>
 <20240406123833.406488-2-npiggin@gmail.com>
 <27ba7613-1344-40b8-bc4d-9a9903ebdcfa@redhat.com>
Message-ID: <D0L9N9ZR13SS.2DNXJZGI7T2BF@gmail.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu Apr 11, 2024 at 5:03 PM AEST, Thomas Huth wrote:
> On 06/04/2024 14.38, Nicholas Piggin wrote:
> > This adds a basic shellcheck sytle file, some directives to help
>
> s/sytle/style/
>
> > find scripts, and a make shellcheck target.
> > 
> > When changes settle down this could be made part of the standard
> > build / CI flow.
> > 
> > Suggested-by: Andrew Jones <andrew.jones@linux.dev>
> > Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> ...
> > diff --git a/README.md b/README.md
> > index 6e82dc225..03ff5994e 100644
> > --- a/README.md
> > +++ b/README.md
> > @@ -193,3 +193,6 @@ with `git config diff.orderFile scripts/git.difforder` enables it.
> >   
> >   We strive to follow the Linux kernels coding style so it's recommended
> >   to run the kernel's ./scripts/checkpatch.pl on new patches.
> > +
> > +Also run make shellcheck before submitting a patch which touches bash
>
> I'd maybe put "make shellcheck" in quotes to make the sentence more readable?

Agreed.

Thanks,
Nick

