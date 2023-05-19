From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 19 May 2023 19:41:57 +0200
Subject: [PATCH v2 0/2] KVM: Fix race between reboot and hardware enabling
In-Reply-To: <20230512233127.804012-1-seanjc@google.com>
References: <20230512233127.804012-1-seanjc@google.com>
Message-ID: <c4d8e54e-28da-f788-5569-e5274b19c34e@redhat.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 5/13/23 01:31, Sean Christopherson wrote:
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
>   - Rename KVM's callback to kvm_shutdown() to match the hook. [Marc]
>   - Don't add a spurious newline. [Marc]
> 
> v1: https://lore.kernel.org/all/20230310221414.811690-1-seanjc at google.com
> 
> Sean Christopherson (2):
>    KVM: Use syscore_ops instead of reboot_notifier to hook
>      restart/shutdown
>    KVM: Don't enable hardware after a restart/shutdown is initiated
> 
>   virt/kvm/kvm_main.c | 43 +++++++++++++++++++++++++++----------------
>   1 file changed, 27 insertions(+), 16 deletions(-)
> 
> 
> base-commit: b3c98052d46948a8d65d2778c7f306ff38366aac

Queued, thanks.

Paolo


