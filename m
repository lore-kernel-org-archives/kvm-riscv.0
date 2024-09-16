From: Andrew Jones <ajones@ventanamicro.com>
Date: Mon, 16 Sep 2024 14:41:27 +0200
Subject: [PATCH v3 2/2] riscv: KVM: add basic support for host vs guest
 profiling
In-Reply-To: <86e8f4eeb30dfc8700089cd88616e6cfb5a142ff.1726126795.git.zhouquan@iscas.ac.cn>
References: <cover.1726126795.git.zhouquan@iscas.ac.cn>
 <86e8f4eeb30dfc8700089cd88616e6cfb5a142ff.1726126795.git.zhouquan@iscas.ac.cn>
Message-ID: <20240916-1d1835e5f16d58c674fdef5b@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Sep 12, 2024 at 04:00:38PM GMT, zhouquan at iscas.ac.cn wrote:
> From: Quan Zhou <zhouquan@iscas.ac.cn>
> 
> For the information collected on the host side, we need to
> identify which data originates from the guest and record
> these events separately, this can be achieved by having
> KVM register perf callbacks.
> 
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> ---
>  arch/riscv/include/asm/kvm_host.h | 10 ++++++++++
>  arch/riscv/kvm/Kconfig            |  1 +
>  arch/riscv/kvm/main.c             | 12 ++++++++++--
>  arch/riscv/kvm/vcpu.c             |  7 +++++++
>  4 files changed, 28 insertions(+), 2 deletions(-)
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

