From: Gowans, James <jgowans@amazon.com>
Date: Wed, 13 Dec 2023 06:47:59 +0000
Subject: [PATCH v2 1/2] KVM: Use syscore_ops instead of reboot_notifier to hook
 restart/shutdown
In-Reply-To: <cf9e15bf3da411ada1c5b2bbdbfdea836029a5e1.camel@amazon.com>
References: <20230512233127.804012-1-seanjc@google.com>
	 <20230512233127.804012-2-seanjc@google.com>
	 <cfed942fc767fa7b2fabc68a3357a7b95bd6a589.camel@amazon.com>
	 <871qbud5f9.fsf@email.froward.int.ebiederm.org>
	 <a02b40d3d9ae5b3037b9a9d5921cfb0144ab5610.camel@amazon.com>
	 <7e30cfc2359dfef39d038e3734f7e5e3d9e82d68.camel@amazon.com>
	 <87wmtk9u46.fsf@email.froward.int.ebiederm.org>
	 <cf9e15bf3da411ada1c5b2bbdbfdea836029a5e1.camel@amazon.com>
Message-ID: <2811860ff7d24fd32dfa0cd8f0f36a33266a58df.camel@amazon.com>
List-Id: <kvm-riscv.lists.infradead.org>
To: kvm-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 2023-12-12 at 10:50 +0200, James Gowans wrote:
> > 
> > In any event I believe the bug with respect to kexec was introduced in
> > commit 6f389a8f1dd2 ("PM / reboot: call syscore_shutdown() after
> > disable_nonboot_cpus()").? That is where syscore_shutdown was removed
> > from kernel_restart_prepare().
> > 
> > At this point it looks like someone just needs to add the missing
> > syscore_shutdown call into kernel_kexec() right after
> > migrate_to_reboot_cpu() is called.
> 
> Seems good and I'm happy to do that; one thing we need to check first:
> are all CPUs online at that point? The commit message for
> 6f389a8f1dd2 ("PM / reboot: call syscore_shutdown() after disable_nonboot_cpus()")
> speaks about: "one CPU on-line and interrupts disabled" when
> syscore_shutdown is called. KVM's syscore shutdown hook does:
> 
> on_each_cpu(hardware_disable_nolock, NULL, 1);
> 
> ... so that smells to me like it wants all the CPUs to be online at
> kvm_shutdown point.
> 
> It's not clear to me:
> 
> 1. Does hardware_disable_nolock actually need to be done on *every* CPU
> or would the offlined ones be fine to ignore because they will be reset
> and the VMXE bit will be cleared that way? With cooperative CPU handover
> we probably do indeed want to do this on every CPU and not depend on
> resetting.
> 
> 2. Are CPUs actually offline at this point? When that commit was
> authored there used to be a call to hardware_disable_nolock() but that's
> not there anymore.

I've sent out a patch:
https://lore.kernel.org/kexec/20231213064004.2419447-1-jgowans at amazon.com/T/#u

Let's continue the discussion there.

JG
