From: Kees Cook <keescook@chromium.org>
Date: Tue, 7 May 2024 16:28:53 -0700
Subject: [PATCH v2 0/5] Define _GNU_SOURCE for sources using
In-Reply-To: <20240507214254.2787305-1-edliaw@google.com>
References: <20240507214254.2787305-1-edliaw@google.com>
Message-ID: <202405071628.7F8C3EC@keescook>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, May 07, 2024 at 09:38:25PM +0000, Edward Liaw wrote:
> 809216233555 ("selftests/harness: remove use of LINE_MAX") introduced
> asprintf into kselftest_harness.h, which is a GNU extension and needs
> _GNU_SOURCE to either be defined prior to including headers or with the
> -D_GNU_SOURCE flag passed to the compiler.
> 
> v1: https://lore.kernel.org/linux-kselftest/20240430235057.1351993-1-edliaw at google.com/
> v2: add -D_GNU_SOURCE to KHDR_INCLUDES so that it is in a single
> location.  Remove #define _GNU_SOURCE from source code to resolve
> redefinition warnings.
> 
> Edward Liaw (5):
>   selftests: Compile kselftest headers with -D_GNU_SOURCE
>   selftests/sgx: Include KHDR_INCLUDES in Makefile
>   selftests: Include KHDR_INCLUDES in Makefile
>   selftests: Drop define _GNU_SOURCE
>   selftests: Drop duplicate -D_GNU_SOURCE

It's a lot of churn, but I don't see a way to do it differently. :)

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook

