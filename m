From: Andrew Jones <ajones@ventanamicro.com>
Date: Wed, 2 Aug 2023 11:17:20 +0300
Subject: [PATCH v2 9/9] docs: kvm: riscv: document EBUSY in
 KVM_SET_ONE_REG
In-Reply-To: <20230801222629.210929-10-dbarboza@ventanamicro.com>
References: <20230801222629.210929-1-dbarboza@ventanamicro.com>
 <20230801222629.210929-10-dbarboza@ventanamicro.com>
Message-ID: <20230802-4751804e563fb13903ef6277@orel>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, Aug 01, 2023 at 07:26:29PM -0300, Daniel Henrique Barboza wrote:
> The EBUSY errno is being used for KVM_SET_ONE_REG as a way to tell
> userspace that a given reg can't be written after the vcpu started.
> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  Documentation/virt/kvm/api.rst | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index c0ddd3035462..229e7cc091c8 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -2259,6 +2259,8 @@ Errors:
>    EINVAL   invalid register ID, or no such register or used with VMs in
>             protected virtualization mode on s390
>    EPERM    (arm64) register access not allowed before vcpu finalization
> +  EBUSY    (riscv) register access not allowed after the vcpu has run
> +           at least once

We allow access (reading, even before, and now also writing when the value
is the same), so this should be worded in a way that conveys the register
may not be changed after the vcpu has run once.

Thanks,
drew

