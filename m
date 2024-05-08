From: Jarkko Sakkinen <jarkko@kernel.org>
Date: Wed, 08 May 2024 19:44:40 +0300
Subject: [PATCH v2 2/5] selftests/sgx: Include KHDR_INCLUDES in Makefile
In-Reply-To: <c3fc5396-bc71-4dee-a3e0-d59dbbc6eda1@intel.com>
References: <20240507214254.2787305-1-edliaw@google.com>
 <20240507214254.2787305-3-edliaw@google.com>
 <c3fc5396-bc71-4dee-a3e0-d59dbbc6eda1@intel.com>
Message-ID: <D14EXNEBOKFY.8SJ7SOCABM01@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Wed May 8, 2024 at 6:33 PM EEST, Dave Hansen wrote:
> On 5/7/24 14:38, Edward Liaw wrote:
> > Add KHDR_INCLUDES to the CFLAGS to pull in the kselftest harness
> > dependencies (-D_GNU_SOURCE).
> > 
> > Also, remove redefinitions of _GNU_SOURCE in the source code.
>
> From an x86 and SGX perspective, looks fine.  I assume Shuah is planning
> on taking this pile.
>
> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>

Yep,

Reviewed-by: Jarkko Sakkinen <jarkko@kernel.org>

I also quickly tested with NUC7 for what it is worth:

Tested-by: Jarkko Sakkinen <jarkko@kernel.org>

BR, Jarkko

