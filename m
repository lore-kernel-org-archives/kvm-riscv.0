From: Sean Christopherson <seanjc@google.com>
Date: Mon, 29 Apr 2024 13:45:25 -0700
Subject: [PATCH] KVM: selftest: Define _GNU_SOURCE for all selftests code
In-Reply-To: <20240423190308.2883084-1-seanjc@google.com>
References: <20240423190308.2883084-1-seanjc@google.com>
Message-ID: <171442341918.161544.2844726781684658994.b4-ty@google.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 23 Apr 2024 12:03:08 -0700, Sean Christopherson wrote:
> Define _GNU_SOURCE is the base CFLAGS instead of relying on selftests to
> manually #define _GNU_SOURCE, which is repetitive and error prone.  E.g.
> kselftest_harness.h requires _GNU_SOURCE for asprintf(), but if a selftest
> includes kvm_test_harness.h after stdio.h, the include guards result in
> the effective version of stdio.h consumed by kvm_test_harness.h not
> defining asprintf():
> 
> [...]

Applied to kvm-x86 selftests_utils, thanks!

[1/1] KVM: selftest: Define _GNU_SOURCE for all selftests code
      https://github.com/kvm-x86/linux/commit/730cfa45b5f4

--
https://github.com/kvm-x86/linux/tree/next

