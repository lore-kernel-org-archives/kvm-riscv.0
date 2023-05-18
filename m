From: Marc Zyngier <maz@kernel.org>
Date: Thu, 18 May 2023 08:38:20 +0100
Subject: [PATCH v2 0/2] KVM: Fix race between reboot and hardware enabling
In-Reply-To: <20230512233127.804012-1-seanjc@google.com>
References: <20230512233127.804012-1-seanjc@google.com>
Message-ID: <86jzx6ks2b.wl-maz@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Sat, 13 May 2023 00:31:25 +0100,
Sean Christopherson <seanjc@google.com> wrote:
> 
> Fix a bug where enabling hardware virtualization can race with a forced
> reboot, e.g. `reboot -f`, and result in virt hardware being enabled when
> the reboot is attempted, and thus hanging the reboot.
> 
> Found by inspection, confirmed by hacking the reboot flow to wait until
> KVM loads (the problematic window is ridiculously small).
> 
> Fully tested only on x86, compile tested on other architectures.
> 
> v2:
>  - Rename KVM's callback to kvm_shutdown() to match the hook. [Marc]
>  - Don't add a spurious newline. [Marc]
> 
> v1: https://lore.kernel.org/all/20230310221414.811690-1-seanjc at google.com
> 
> Sean Christopherson (2):
>   KVM: Use syscore_ops instead of reboot_notifier to hook
>     restart/shutdown
>   KVM: Don't enable hardware after a restart/shutdown is initiated
> 
>  virt/kvm/kvm_main.c | 43 +++++++++++++++++++++++++++----------------
>  1 file changed, 27 insertions(+), 16 deletions(-)

Acked-by: Marc Zyngier <maz@kernel.org>

	M.

-- 
Without deviation from the norm, progress is not possible.

