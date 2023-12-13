From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 13 Dec 2023 15:18:14 +0100
Subject: [PATCH v4 10/11] KVM: riscv: selftests: Add sstc timer test
In-Reply-To: <3bb7d5ae5a1a016e970faa0759c47214c9391b19.1702371136.git.haibo1.xu@intel.com>
References: <cover.1702371136.git.haibo1.xu@intel.com>
 <3bb7d5ae5a1a016e970faa0759c47214c9391b19.1702371136.git.haibo1.xu@intel.com>
Message-ID: <20231213-4ba5fcc75b41cd19ec96f08e@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Dec 12, 2023 at 05:31:19PM +0800, Haibo Xu wrote:
> Add a KVM selftests to validate the Sstc timer functionality.
> The test was ported from arm64 arch timer test.
> 
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> ---
>  tools/testing/selftests/kvm/Makefile          |   1 +
>  .../selftests/kvm/aarch64/arch_timer.c        |  12 +-
>  tools/testing/selftests/kvm/arch_timer.c      |  10 +-
>  .../selftests/kvm/include/riscv/arch_timer.h  |  71 ++++++++++++
>  .../selftests/kvm/include/riscv/processor.h   |  10 ++
>  .../selftests/kvm/include/timer_test.h        |   5 +-
>  .../testing/selftests/kvm/riscv/arch_timer.c  | 107 ++++++++++++++++++
>  7 files changed, 206 insertions(+), 10 deletions(-)
>  create mode 100644 tools/testing/selftests/kvm/include/riscv/arch_timer.h
>  create mode 100644 tools/testing/selftests/kvm/riscv/arch_timer.c
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

