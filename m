From: Thomas Huth <thuth@redhat.com>
Date: Thu, 11 Apr 2024 09:03:04 +0200
Subject: [RFC kvm-unit-tests PATCH v2 01/14] Add initial shellcheck
 checking
In-Reply-To: <20240406123833.406488-2-npiggin@gmail.com>
References: <20240406123833.406488-1-npiggin@gmail.com>
 <20240406123833.406488-2-npiggin@gmail.com>
Message-ID: <27ba7613-1344-40b8-bc4d-9a9903ebdcfa@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 06/04/2024 14.38, Nicholas Piggin wrote:
> This adds a basic shellcheck sytle file, some directives to help

s/sytle/style/

> find scripts, and a make shellcheck target.
> 
> When changes settle down this could be made part of the standard
> build / CI flow.
> 
> Suggested-by: Andrew Jones <andrew.jones@linux.dev>
> Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
...
> diff --git a/README.md b/README.md
> index 6e82dc225..03ff5994e 100644
> --- a/README.md
> +++ b/README.md
> @@ -193,3 +193,6 @@ with `git config diff.orderFile scripts/git.difforder` enables it.
>   
>   We strive to follow the Linux kernels coding style so it's recommended
>   to run the kernel's ./scripts/checkpatch.pl on new patches.
> +
> +Also run make shellcheck before submitting a patch which touches bash

I'd maybe put "make shellcheck" in quotes to make the sentence more readable?

> +scripts.
> diff --git a/scripts/common.bash b/scripts/common.bash
> index ee1dd8659..3aa557c8c 100644
> --- a/scripts/common.bash
> +++ b/scripts/common.bash
> @@ -82,8 +82,11 @@ function arch_cmd()
>   }
>   
>   # The current file has to be the only file sourcing the arch helper
> -# file
> +# file. Shellcheck can't follow this so help it out. There doesn't appear to be a
> +# way to specify multiple alternatives, so we will have to rethink this if things
> +# get more complicated.
>   ARCH_FUNC=scripts/${ARCH}/func.bash
>   if [ -f "${ARCH_FUNC}" ]; then
> +# shellcheck source=scripts/s390x/func.bash
>   	source "${ARCH_FUNC}"
>   fi

  Thomas


