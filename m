From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 4 Sep 2023 15:46:11 +0200
Subject: [PATCH v2 5/8] KVM: riscv: selftests: Add exception handling
 support
In-Reply-To: <ff41e98a062e0fbb5c2d8dc26d9e4e02c4ce3ea8.1693659382.git.haibo1.xu@intel.com>
References: <cover.1693659382.git.haibo1.xu@intel.com>
 <ff41e98a062e0fbb5c2d8dc26d9e4e02c4ce3ea8.1693659382.git.haibo1.xu@intel.com>
Message-ID: <20230904-c4d2ea8fcfdea6e6722332b2@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, Sep 02, 2023 at 08:59:27PM +0800, Haibo Xu wrote:
> Add the infrastructure for guest exception handling in riscv selftests.
> Customized handlers can be enabled by vm_install_exception_handler(vector)
> or vm_install_interrupt_handler().
> 
> The code is inspired from that of x86/arm64.
> 
> Signed-off-by: Haibo Xu <haibo1.xu@intel.com>
> ---
>  tools/testing/selftests/kvm/Makefile          |   1 +
>  .../selftests/kvm/include/riscv/processor.h   |  43 ++++++++
>  .../selftests/kvm/lib/riscv/handlers.S        | 101 ++++++++++++++++++
>  .../selftests/kvm/lib/riscv/processor.c       |  69 ++++++++++++
>  4 files changed, 214 insertions(+)
>  create mode 100644 tools/testing/selftests/kvm/lib/riscv/handlers.S
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

