From: Oliver Upton <oliver.upton@linux.dev>
Date: Thu, 25 Apr 2024 22:41:32 +0000
Subject: [PATCH] KVM: selftest: Define _GNU_SOURCE for all selftests code
In-Reply-To: <20240423190308.2883084-1-seanjc@google.com>
References: <20240423190308.2883084-1-seanjc@google.com>
Message-ID: <ZircHEd4GZPApm21@linux.dev>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Apr 23, 2024 at 12:03:08PM -0700, Sean Christopherson wrote:
> Define _GNU_SOURCE is the base CFLAGS instead of relying on selftests to
> manually #define _GNU_SOURCE, which is repetitive and error prone.  E.g.
> kselftest_harness.h requires _GNU_SOURCE for asprintf(), but if a selftest
> includes kvm_test_harness.h after stdio.h, the include guards result in
> the effective version of stdio.h consumed by kvm_test_harness.h not
> defining asprintf():
> 
>   In file included from x86_64/fix_hypercall_test.c:12:
>   In file included from include/kvm_test_harness.h:11:
>  ../kselftest_harness.h:1169:2: error: call to undeclared function
>   'asprintf'; ISO C99 and later do not support implicit function declarations
>   [-Wimplicit-function-declaration]
>    1169 |         asprintf(&test_name, "%s%s%s.%s", f->name,
>         |         ^
> 
> When including the rseq selftest's "library" code, #undef _GNU_SOURCE so
> that rseq.c controls whether or not it wants to build with _GNU_SOURCE.
> 
> Reported-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Acked-by: Oliver Upton <oliver.upton@linux.dev>

-- 
Thanks,
Oliver

