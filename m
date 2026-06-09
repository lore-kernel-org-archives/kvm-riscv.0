Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C114CD6E79
	for <kvm-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 09:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	In-Reply-To:Date:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=GgC4hJ4bCErNyL+0WwOyL9h2tw1daGZVwHpbLB+WiLE=; b=TyY
	POJp9n41hiX6RtdzdewNOjfAf1Pz2okS0K7wO/zHVYMKsDoKQlDpz1rJ2n77sSOe3H/+ECFeXCdTz
	jLmPPggBZY31qKYQ8Pzjne3E1WTOnR/+a9AYK7Udg3KcM99j2eplDqwJc5kg6ML3LauH+CdP1dTpD
	/xX4GOhqLz63LjeHxD0v9W4NbhpVU2iBgKZaFHbsQHn4KEsCUdwWhtDlal0TFqtf1BSzkhIUOGH/z
	8adnlaG1GjzlqANApixI5WWZuNkF8XNAb1kNnXHGhuEFfhzgaSgkyhJQcWbvp8jeHC04yI92jDd09
	9IGTY7pSGYNzmppZthlireoPt09CMfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWslk-00000005Cvg-3oVQ;
	Tue, 09 Jun 2026 09:29:12 +0000
Received: from mail-ot1-f69.google.com ([209.85.210.69])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWslh-00000005CvI-46Eu
	for kvm-riscv@lists.infradead.org;
	Tue, 09 Jun 2026 09:29:11 +0000
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7e6c8a160c4so10900710a34.1
        for <kvm-riscv@lists.infradead.org>; Tue, 09 Jun 2026 02:29:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780997348; x=1781602148;
        h=cc:to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tDtntZKOvf+QgM91JxUiEGn+OVlpeQ6B56aULm94QfI=;
        b=fBqsbWpSen65+33rVHMH3hIFqSdoUSMD8NoX6rBCptxkSN+DtzVftrz4dLaHbIU4B/
         wImux40WaIp/+Mvk4rwTJHm+HGj5z4aDmh8PqUHLbf6eDU9GmPflGo89DNO6zS5u3kUp
         kiqnc39C+1yTGYpSEt59LBp4EJJKREDz4LnXYoRvKgjaUYde7/+sBO5jOSddfajSMgT8
         mr0mtKd+Q81vWuLmu/94Jse192pYzPMI8CkRpoIyFfK0hxZ4zPCzHU4uHvkXljIfQTQM
         y7V/KcFFtoI0X60wauh7YNWy9XE6zcyUC9LCXxGWGIadfNjbDkb/gog5NCBZoWv8zePy
         Q9Rw==
X-Forwarded-Encrypted: i=1; AFNElJ8L+hQp7jYe54pC0k2OPW9fMHw88HS3FG1040k9QCZrXdsChsjCrIha67S/RBNGFMzVOVtpTqYTR1s=@lists.infradead.org
X-Gm-Message-State: AOJu0YyQ2oXGBdKKymYM05E/Sy/+T7myLxbrza+Df6EnyJyAkDUYteIc
	n2baXTYMEtyvLBI9hdAfmtYxbNhXnykOtU6Gg8sqRkwSMgyLaEur9u2FKRSyGyym3PPSVcYJYEY
	WmU88nl/2ncOS5QlCJDcSnFW1U569fHIVtYm971diBGHjnfZQJOWZl03uEBk=
MIME-Version: 1.0
X-Received: by 2002:a05:6820:818f:b0:69e:424a:8df1 with SMTP id
 006d021491bc7-69e68b4b285mr10545972eaf.19.1780997348483; Tue, 09 Jun 2026
 02:29:08 -0700 (PDT)
Date: Tue, 09 Jun 2026 02:29:08 -0700
In-Reply-To: <20260608144252.351443-1-joro@8bytes.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a27dce4.39669fcc.33b062.0090.GAE@google.com>
Subject: [syzbot ci] Re: KVM Planes + SEV-SNP Support
From: syzbot ci <syzbot+ci5127b91b8837842d@syzkaller.appspotmail.com>
To: anelkz@amazon.de, ashish.kalra@amd.com, clopez@suse.de, 
	coconut-svsm@lists.linux.dev, huibo.wang@amd.com, 
	james.bottomley@hansenpartnership.com, joerg.roedel@amd.com, joro@8bytes.org, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	michael.roth@amd.com, nsaenz@amazon.com, pbonzini@redhat.com, 
	seanjc@google.com, thomas.lendacky@amd.com, x86@kernel.org
Cc: syzbot@lists.linux.dev, syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_022910_031848_98543E6C 
X-CRM114-Status: GOOD (  10.31  )
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

syzbot ci has tested the following series

[v1] KVM Planes + SEV-SNP Support
https://lore.kernel.org/all/20260608144252.351443-1-joro@8bytes.org
* [PATCH 01/60] x86/sev: Define the #HV doorbell page structure
* [PATCH 02/60] KVM: SVM: Add support for the SEV-SNP #HV doorbell page NAE event
* [PATCH 03/60] KVM: SVM: Inject #HV when Restricted Injection is active
* [PATCH 04/60] KVM: SVM: Inject NMIs when Restricted Injection is active
* [PATCH 05/60] KVM: SVM: Inject MCEs when Restricted Injection is active
* [PATCH 06/60] KVM: SVM: Enable Restricted Injection for an SEV-SNP guest
* [PATCH 07/60] KVM: SVM: Add support for the SEV-SNP #HV IPI NAE event
* [PATCH 08/60] Documentation: kvm: introduce "VM plane" concept
* [PATCH 09/60] kvm: Introduce struct kvm_plane
* [PATCH 10/60] kvm: Move vcpu_array to struct kvm_plane
* [PATCH 11/60] kvm: Introduce struct kvm_vcpu_common
* [PATCH 12/60] kvm: Move vcpu accounting to struct kvm_vcpu_common
* [PATCH 13/60] kvm: Add read accessors for kvm_vcpu scheduling state
* [PATCH 14/60] kvm: Make kvm_running_vcpus point to struct kvm_vcpu_common
* [PATCH 15/60] kvm: Move VCPU scheduling state to struct kvm_vcpu_common
* [PATCH 16/60] kvm: Add accessors for kvm_vcpu->mutex
* [PATCH 17/60] kvm: Move VCPU locking to struct kvm_vcpu_common
* [PATCH 18/60] kvm: Move kvm_vcpu->rcuwait to struct kvm_vcpu_common
* [PATCH 19/60] kvm: Introduce accessors for kvm_vcpu->mode
* [PATCH 20/60] kvm: Move kvm_vcpu mode and requests field to struct kvm_vcpu_common
* [PATCH 21/60] kvm: Introduce per-plane VCPU requests
* [PATCH 22/60] kvm: Move kvm_vcpu pid members to struct kvm_vcpu_common
* [PATCH 23/60] kvm: Move kvm_vcpu sigset members to struct kvm_vcpu_common
* [PATCH 24/60] kvm: Move kvm_vcpu spinloop members to struct kvm_vcpu_common
* [PATCH 25/60] kvm: Move kvm_vcpu->dirty_ring to struct kvm_vcpu_common
* [PATCH 26/60] kvm: Introduce arch-specific plane state
* [PATCH 27/60] kvm: Introduce arch-specific part of struct kvm_vcpu_common
* [PATCH 28/60] kvm: Implement KVM_CAP_PLANES
* [PATCH 29/60] kvm: Implement KVM_CREATE_PLANE ioctl
* [PATCH 30/60] kvm: Add KVM_EXIT_PLANE_EVENT
* [PATCH 31/60] kvm: Allocate struct kvm_plane in architecture code
* [PATCH 32/60] kvm: Allocate struct kvm_run only for struct kvm_vcpu_common
* [PATCH 33/60] KVM: Implement KVM_CREATE_VCPU ioctl for planes
* [PATCH 34/60] kvm: Keep track of plane VCPUs in struct kvm_vcpu_common
* [PATCH 35/60] kvm: Add VCPU plane-scheduling state and helpers
* [PATCH 36/60] kvm: Add plane_level to kvm_kernel_irq_routing_entry
* [PATCH 37/60] kvm: Pass plane_level to kvm_set_routing_entry()
* [PATCH 38/60] kvm: Make KVM_SIGNAL_MSI per plane
* [PATCH 39/60] kvm: Make KVM_SET_GSI_ROUTING per plane
* [PATCH 40/60] kvm: x86: Handle IOAPIC EOIs per plane
* [PATCH 41/60] kvm: x86: Make apic_map per plane
* [PATCH 42/60] kvm: x86: Make local APIC code aware of planes
* [PATCH 43/60] kvm: x86: Move CPUID state to struct kvm_vcpu_arch_common
* [PATCH 44/60] kvm: x86: Move cpu_caps to struct kvm_vcpu_arch_common
* [PATCH 45/60] kvm: x86: Update state for all plane VCPUs after CPUID update
* [PATCH 46/60] kvm: x86: Share MTRR state across planes
* [PATCH 47/60] kvm: x86: Select a plane to run
* [PATCH 48/60] kvm: x86: Make event injection VCPU requests per-plane
* [PATCH 49/60] kvm: x86: Allow hardware backend to overwrite struct kvm_plane allocation
* [PATCH 50/60] kvm: x86: Make KVM_REQ_UPDATE_PROTECTED_GUEST_STATE per plane
* [PATCH 51/60] kvm: x86: Share pio_data across planes
* [PATCH 52/60] kvm: x86: Switch to plane0 if it has events
* [PATCH 53/60] kvm: x86: Introduce max_planes x86-op
* [PATCH 54/60] kvm: x86: Restrict KVM planes support to KVM_IRQCHIP_SPLIT
* [PATCH 55/60] kvm: svm: Track vmsa_features per plane
* [PATCH 56/60] kvm: svm: Implement GET_AP_APIC_IDS NAE event
* [PATCH 57/60] kvm: sev: Allow for VMPL level specification in AP create
* [PATCH 58/60] kvm: svm: Invoke a specified VMPL level VMSA for the vCPU
* [PATCH 59/60] kvm: svm: Implement max_planes x86 operation
* [PATCH 60/60] kvm: svm: Advertise full multi-VMPL support to the SNP guest

and found the following issue:
WARNING in __kvm_plane_ioctl

Full report is available here:
https://ci.syzbot.org/series/7426b4e7-e1df-4f2e-8464-acda36316e29

***

WARNING in __kvm_plane_ioctl

tree:      torvalds
URL:       https://kernel.googlesource.com/pub/scm/linux/kernel/git/torvalds/linux
base:      2d3090a8aeb596a26935db0955d46c9a5db5c6ce
arch:      amd64
compiler:  Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8
config:    https://ci.syzbot.org/builds/f9f7af87-a544-413f-b7e0-662f92794f11/config
syz repro: https://ci.syzbot.org/findings/751865bf-494c-4000-9b11-d8aa15f03893/syz_repro

------------[ cut here ]------------
r == -EBUSY
WARNING: arch/x86/kvm/../../../virt/kvm/kvm_main.c:4412 at kvm_plane_ioctl_create_vcpu virt/kvm/kvm_main.c:4412 [inline], CPU#1: syz.2.19/5809
WARNING: arch/x86/kvm/../../../virt/kvm/kvm_main.c:4412 at __kvm_plane_ioctl+0x8bd/0xa70 virt/kvm/kvm_main.c:4908, CPU#1: syz.2.19/5809
Modules linked in:
CPU: 1 UID: 0 PID: 5809 Comm: syz.2.19 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
RIP: 0010:kvm_plane_ioctl_create_vcpu virt/kvm/kvm_main.c:4412 [inline]
RIP: 0010:__kvm_plane_ioctl+0x8bd/0xa70 virt/kvm/kvm_main.c:4908
Code: e8 c8 0a 09 00 4c 89 f7 e8 80 a3 ff ff 48 8b 3d a9 a8 fd 11 4c 89 f6 e8 c1 35 e7 00 49 63 c7 e9 8c fc ff ff e8 94 2f 87 00 90 <0f> 0b 90 41 bf f0 ff ff ff eb bc e8 e3 eb 68 0a 89 f9 80 e1 07 80
RSP: 0018:ffffc9000318f940 EFLAGS: 00010293
RAX: ffffffff813f480c RBX: ffff8881ba113410 RCX: ffff88810d4f4a80
RDX: 0000000000000000 RSI: ffffffff8e6fa0b0 RDI: 00000000fffffff0
RBP: ffffc9000318fa70 R08: ffff88810d4f4a80 R09: 0000000000000002
R10: 00000000fffffff0 R11: 0000000000000000 R12: 1ffff92000631f34
R13: dffffc0000000000 R14: ffff8881b446cb18 R15: 00000000fffffff0
FS:  00007f13e64ad6c0(0000) GS:ffff8882a929c000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f13e64acff8 CR3: 00000001a6053000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 kvm_vm_ioctl+0x88e/0xbf0 virt/kvm/kvm_main.c:5546
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f13e559ce59
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f13e64ad028 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f13e5816090 RCX: 00007f13e559ce59
RDX: 0000000000000000 RSI: 000000000000ae41 RDI: 0000000000000004
RBP: 00007f13e5632d6f R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f13e5816128 R14: 00007f13e5816090 R15: 00007fff90c39748
 </TASK>


***

If these findings have caused you to resend the series or submit a
separate fix, please add the following tag to your commit message:
  Tested-by: syzbot@syzkaller.appspotmail.com

---
This report is generated by a bot. It may contain errors.
syzbot ci engineers can be reached at syzkaller@googlegroups.com.

To test a patch for this bug, please reply with `#syz test`
(should be on a separate line).

The patch should be attached to the email.
Note: arguments like custom git repos and branches are not supported.

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
