From: Andrew Jones <ajones@ventanamicro.com>
Date: Tue, 1 Aug 2023 11:21:48 +0200
Subject: [PATCH v4.1 1/3] KVM: selftests: Add arch ucall.h and inline
 simple arch hooks
In-Reply-To: <20230731203026.1192091-2-seanjc@google.com>
References: <20230731203026.1192091-1-seanjc@google.com>
 <20230731203026.1192091-2-seanjc@google.com>
Message-ID: <20230801-3ab43c432cbaafcadbffb092@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jul 31, 2023 at 01:30:24PM -0700, Sean Christopherson wrote:
> Add an architecture specific ucall.h and inline the simple arch hooks,
> e.g. the init hook for everything except ARM, and the actual "do ucall"
> hook for everything except x86 (which should be simple, but temporarily
> isn't due to carrying a workaround).
> 
> Having a per-arch ucall header will allow adding a #define for the
> expected KVM exit reason for a ucall that is colocated (for everything
> except x86) with the ucall itself.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  .../selftests/kvm/include/aarch64/ucall.h      | 18 ++++++++++++++++++
>  .../selftests/kvm/include/riscv/ucall.h        | 18 ++++++++++++++++++
>  .../selftests/kvm/include/s390x/ucall.h        | 17 +++++++++++++++++
>  .../selftests/kvm/include/ucall_common.h       |  1 +
>  .../selftests/kvm/include/x86_64/ucall.h       | 11 +++++++++++
>  .../testing/selftests/kvm/lib/aarch64/ucall.c  | 11 +----------
>  tools/testing/selftests/kvm/lib/riscv/ucall.c  | 11 -----------
>  tools/testing/selftests/kvm/lib/s390x/ucall.c  | 10 ----------
>  tools/testing/selftests/kvm/lib/x86_64/ucall.c |  4 ----
>  9 files changed, 66 insertions(+), 35 deletions(-)
>  create mode 100644 tools/testing/selftests/kvm/include/aarch64/ucall.h
>  create mode 100644 tools/testing/selftests/kvm/include/riscv/ucall.h
>  create mode 100644 tools/testing/selftests/kvm/include/s390x/ucall.h
>  create mode 100644 tools/testing/selftests/kvm/include/x86_64/ucall.h
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

