Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F53CC43458
	for <kvm-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 12:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qoqAGjvQc+SKop1CP3U9SWtIVv/HGOSrqQkCQIYNYL0=; b=mo8x9VRmI49Z16
	gA5trLxR0Osl3wV/ZXnrLCUzHRkkPhwcyJDkJ/0Qvv1tfEpPNsNir41J7LQKPiDJXuMLLOsWS9xe0
	1vyHwsvjf3P/9KDkAobJSiTeIq2Cju1CZBd0EEg0pB001kiEPuVMXt5fh9wMMQic8q+GFPZR1by4w
	BkH0asGjjCiCW6+gorPxpBn4NGfR5Ka2UJzbGHyd178X0iaks8g3i4zJnlfSk+3AkzGKx57638c4P
	ONpSlZMB5fyh1o+Vq2FJv/UJ77p0Alvpf/5LX/aNHOqGxGZ2IVxY26RD6qUQ3jP8Vf0QYvoy8Yuhu
	GNsDGkQQ0AiZLxWtw0Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdAO-00000006z0t-2OV5;
	Fri, 03 Jul 2026 12:38:48 +0000
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfdAL-00000006yz2-4AZ0;
	Fri, 03 Jul 2026 12:38:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1783082320; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=K8IESsN7IazgF4kkAKc3Bjn0YxF6z3ruog0n74pY0Hc=;
	b=lx/4tCcE3j9pBL/EYarlFvM2Z334PsbGudNQlhwSTQ1MfOSOgqGfWY6BpuQQmPbUFLPG20i/wgNi8vzxcVRScr4PpXWFLsmgEweCSV8DbzR75GV/IPbyh4BRfjAD2LiZZjaAlVs2I8L6bfNeptvZWuW+Z4jf2ZQJY//8tEQXa3U=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=23;SR=0;TI=SMTPD_---0X6JE1Zq_1783082316;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0X6JE1Zq_1783082316 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 03 Jul 2026 20:38:38 +0800
From: fangyu.yu@linux.alibaba.com
To: zhangzhanpeng.jasper@bytedance.com
Cc: ajones@ventanamicro.com,
	andrew.jones@oss.qualcomm.com,
	alex@ghiti.fr,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	cuiyunhui@bytedance.com,
	fangyu.yu@linux.alibaba.com,
	guoren@kernel.org,
	iommu@lists.linux.dev,
	joro@8bytes.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pbonzini@redhat.com,
	pjw@kernel.org,
	robin.murphy@arm.com,
	tjeznach@rivosinc.com,
	will@kernel.org,
	yuanzhu@bytedance.com
Subject: Re: [RFC PATCH 0/3] RISC-V: KVM/IOMMU: Fix MRIF irqfd notice handling 
Date: Fri,  3 Jul 2026 20:38:35 +0800
Message-Id: <20260703123835.41006-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20260701040017.42707-1-zhangzhanpeng.jasper@bytedance.com>
References: <20260701040017.42707-1-zhangzhanpeng.jasper@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_053846_391868_03406F37 
X-CRM114-Status: GOOD (  16.34  )
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

>Hi Fangyu,
>
>I put together a local test branch based on Andrew's RISC-V IOMMU
>irqbypass series [1] and your MRIF RFC series [2], then ran VFIO device
>assignment tests on hardware on top of that combined tree.
>
>One test case that exposed a problem was a VFIO guest started with QEMU's
>AIA emulation mode, e.g. `riscv-aia=emul`.  The guest could hang because
>a normal MSI injection was classified as a MRIF notice, so KVM skipped
>the software IMSIC EIP update and the interrupt was never made pending.
>
>The issue is that the current code identifies a MRIF notice by comparing
>the injected guest interrupt ID with cached host MSI data:
>
>    msg->data == iid
>
>That is a payload value comparison, not a source/provenance check.  A
>normal MSI injection can carry the same interrupt ID value as a cached
>host MSI message.  If the vCPU is currently using the software IMSIC file
>and this collision happens, KVM can misclassify the normal MSI as a MRIF
>notice, skip the software IMSIC EIP update, and leave the guest waiting
>for an interrupt that was never made pending.

Hi Zhanpeng,

Thanks for reviewing and testing my patches, and for pointing out
the race condition issues. Your analysis is very helpful.

A few notes on the current status:

My original patches were based on Andrew Jones's tree [1]. Andrew
has since published a v2 [2], and I have adapted my work on top of
that version with some additional fixes. However, Andrew's v2 still
needs further adjustments, so I plan to rebase onto his v3 once it
is available.

When I send out my v2, I will take your patchset into consideration.

Thanks again for your effort.

[1] https://github.com/jones-drew/linux/tree/riscv/
    iommu-irqbypass-rfc-v2-rc1
[2] https://lore.kernel.org/linux-riscv/
    20250920203851.2205115-20-ajones@ventanamicro.com/

Fangyu

>This series identifies MRIF notices by irqfd route provenance instead.
>irqfd_wakeup() already injects from a seqcount-protected copy of
>irqfd->irq_entry, so patch 2 keeps the architecture's MRIF notice metadata
>in that route snapshot.  Userspace MSI injection and normal guest MSI
>injection do not carry irqfd MRIF provenance and therefore follow the
>normal software IMSIC path.
>
>The generic KVM change is needed because the decision must be made from
>the same copied route that irqfd_wakeup() injects from; keeping the
>provenance in RISC-V side state would not be tied to that route snapshot.
>
>Feel free to fold any of these patches into previous commits if you think
>that is a better shape for the next version. I also have a few other local
>adaptation and improvement patches on top, but kept them out of this series
>to focus on the MRIF notice issue. Please let me know if you already have a
>plan for the next revision, I am happy to support your next version in
>whichever form is useful.
>
>Zhanpeng Zhang (3):
>  iommu/riscv: Complete MRIF MSI PTE setup
>  KVM: Move irqfd arch data into route snapshots
>  RISC-V: KVM: Identify MRIF notices from irqfd snapshots
>
>These patches are based on a combined tree, not a plain upstream tree.
>The combined tree is made up of the following pieces:
>In your series, patch 4/6 is already covered by the irqbypass series [1].
>I ported patches 1/6, 2/6, 3/6, the relevant MRIF MSI PTE part of 5/6,
>and the notice handler part of 6/6, with a few integration changes.
>
>Fangyu Yu's MRIF RFC series [2] (selected patches):
>  [1/6] RISC-V: Add more elements to irqbypass vcpu_info
>  [2/6] RISC-V: KVM: Transfer the physical address of MRIF to iommu-ir
>  [3/6] RISC-V: KVM: Add a xarray to record host irq msg
>  [5/6, adapted] iommu/riscv: Add MRIF mode support
>  [6/6, adapted] RISC-V: KVM: Check the MRIF in notice MSI irq handler
>
>Andrew Jones et al. [1] (irqbypass series, omitted):
>  [RFC PATCH v2 00/18] iommu/riscv: Add irqbypass support
>
>[1] https://lists.infradead.org/pipermail/kvm-riscv/2025-September/010148.html
>[2] https://lwn.net/ml/all/20250811061104.10326-1-fangyu.yu@linux.alibaba.com/

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
