From: Marc Zyngier <maz@kernel.org>
Date: Mon, 13 Mar 2023 17:57:00 +0000
Subject: [PATCH 2/2] KVM: Don't enable hardware after a restart/shutdown is initiated
In-Reply-To: <ZA86UINtWH3aw4Mv@google.com>
References: <20230310221414.811690-1-seanjc@google.com>
	<20230310221414.811690-3-seanjc@google.com>
	<87fsaa5kyv.wl-maz@kernel.org>
	<ZA86UINtWH3aw4Mv@google.com>
Message-ID: <86jzzky1oz.wl-maz@kernel.org>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, 13 Mar 2023 15:02:27 +0000,
Sean Christopherson <seanjc@google.com> wrote:
> 
> On my todo list is to better understand whether or not the other architectures
> that utilize the generic hardware enabling (ARM, RISC-V, MIPS) truly need to disable
> virtualization during a reboot, versus KVM simply being polite.  E.g. on x86, if VMX
> is left enabled, reboot may hang depending on how the reboot is performed.   If
> other architectures really truly need to disable virtualization, then they likely
> need something similar to x86's emergency reboot shenanigans.

At least pre-CCA, there isn't much to do, because there is no such
thing as "disabling virtualisation". For kexec, the only things we
need to do are to go back to EL2 in the nVHE case, and in any case to
put all other CPUs back into the firmware (PSCI CPU_OFF).

CCA may well add other things into the picture, because it is a
parallel exception level that KVM doesn't really control. That's one
of the many open questions I have about this "lovely" piece of
architecture.

Of course, if we were to completely ignore CCA and instead use the
underlying HW (aka RME), things would be a lot simpler and we'd be
back to my original statement...

	M.

-- 
Without deviation from the norm, progress is not possible.

