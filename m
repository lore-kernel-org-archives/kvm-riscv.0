From: Andrew Jones <andrew.jones@linux.dev>
Date: Mon, 29 Aug 2022 18:21:11 +0200
Subject: [PATCH v5 6/7] KVM: selftest: Drop now-unnecessary ucall_uninit()
In-Reply-To: <20220825232522.3997340-7-seanjc@google.com>
References: <20220825232522.3997340-1-seanjc@google.com>
 <20220825232522.3997340-7-seanjc@google.com>
Message-ID: <20220829162111.wl65dxexk5qtrssf@kamzik>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Aug 25, 2022 at 11:25:21PM +0000, Sean Christopherson wrote:
> Drop ucall_uninit() and ucall_arch_uninit() now that ARM doesn't modify
> the host's copy of ucall_exit_mmio_addr, i.e. now that there's no need to
> reset the pointer before potentially creating a new VM.  The few calls to
> ucall_uninit() are all immediately followed by kvm_vm_free(), and that is
> likely always going to hold true, i.e. it's extremely unlikely a test
> will want to effectively disable ucall in the middle of a test.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  tools/testing/selftests/kvm/dirty_log_test.c       |  1 -
>  tools/testing/selftests/kvm/include/ucall_common.h |  6 ------
>  tools/testing/selftests/kvm/kvm_page_table_test.c  |  1 -
>  tools/testing/selftests/kvm/lib/aarch64/ucall.c    | 14 ++------------
>  tools/testing/selftests/kvm/lib/perf_test_util.c   |  1 -
>  tools/testing/selftests/kvm/lib/riscv/ucall.c      |  4 ----
>  tools/testing/selftests/kvm/lib/s390x/ucall.c      |  4 ----
>  tools/testing/selftests/kvm/lib/x86_64/ucall.c     |  4 ----
>  8 files changed, 2 insertions(+), 33 deletions(-)
>

Reviewed-by: Andrew Jones <andrew.jones@linux.dev>

