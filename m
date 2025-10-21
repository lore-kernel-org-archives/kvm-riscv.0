Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3459DCCD19F
	for <kvm-riscv@archiver.kernel.org>; Tue, 21 Oct 2025 01:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+PSmLYN3apTvy7+AHZqBOPxVfhoTB1dpjEyxXHMjDdM=; b=13ABqV2plXvNw5
	8+cGADyAu1PmoE2OLPZZ6UTYOey1SaRIFw6/jB+ac+3AOLgb56dM0ZEZ+Cq+gfUrfs0DnIClyWocQ
	QBq8GQ3bMbVzRGnbnE8qwsAwcAc8qTkuNiyzM5vMXMbUAKl5Z8yzwij35Lf0ZuJ+kb/mcWNj+8vXv
	UoEXKnFcVj+HSmK1TJZaWFiQ6l9PEcAW0Ege3+PWjsTjECZW0ky8zjz1t8E2IDwEkojS2o4YfCvPd
	tyObZB6YrRqkZb0t83VUPR54JVJs1QqT1VUPIzgyXSTItxvCKH+CG163sLnsEWhul2Clvs/lBv05t
	S13t2xmC1gj27L6QqiGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB1Qc-0000000FUPv-30vu;
	Tue, 21 Oct 2025 01:44:46 +0000
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB1QZ-0000000FUOP-24nc;
	Tue, 21 Oct 2025 01:44:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1761011080; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=3rggCTCwug85NvywRQ6sf6WRszwDZIZt8nJfB05isZ0=;
	b=H5psPa8ue415FhOjoF8VJ56wUa0JzNs7qVBkw0lMXbrpbIudsrO+Jyd5y0TbK36lgE7RjuaFGB9wtOe0gKSJhdA66iUS4/UmDm3Ta7TrRaOPtV1Gj6/HxV0DFf55kQXnNIlX+gRZyLJ9BmXhyF4jQmx0/VK3UbMBf++16TXkCxY=
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0Wqh4M2p_1761011078 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 21 Oct 2025 09:44:39 +0800
From: fangyu.yu@linux.alibaba.com
To: dbarboza@ventanamicro.com
Cc: alex@ghiti.fr,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	fangyu.yu@linux.alibaba.com,
	guoren@kernel.org,
	jiangyifei@huawei.com,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	pbonzini@redhat.com,
	pjw@kernel.org
Subject: Re: Re: [PATCH] RISC-V: KVM: Remove automatic I/O mapping for VM_PFNMAP 
Date: Tue, 21 Oct 2025 09:44:37 +0800
Message-Id: <20251021014437.850-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <ca6a8e5a-f14d-4017-90dc-be566d594eee@ventanamicro.com>
References: <ca6a8e5a-f14d-4017-90dc-be566d594eee@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_184444_142819_005A7DC1 
X-CRM114-Status: GOOD (  11.72  )
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

>> From: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>> 
>> As of commit aac6db75a9fc ("vfio/pci: Use unmap_mapping_range()"),
>> vm_pgoff may no longer guaranteed to hold the PFN for VM_PFNMAP
>> regions. Using vma->vm_pgoff to derive the HPA here may therefore
>> produce incorrect mappings.
>> 
>> Instead, I/O mappings for such regions can be established on-demand
>> during g-stage page faults, making the upfront ioremap in this path
>> is unnecessary.
>> 
>> Fixes: 9d05c1fee837 ("RISC-V: KVM: Implement stage2 page table programming")
>> Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
>> ---
>
>Hi,
>
>This patch fixes the issue observed by Drew in [1]. I was helping Drew
>debug it using a QEMU guest inside an emulated risc-v host with the
>'virt' machine + IOMMU enabled.

Thank you for testing this patch.
As you can see below, because of the previous HPA calculation error,
the GVA is mapped to an incorrect HPA, and finally a store amo/access
exception occurs.

>
>Using the patches from [2], without the workaround patch (18), booting a
>guest with a passed-through PCI device fails with a store amo fault and a
>kernel oops:
>
>[    3.304776] Oops - store (or AMO) access fault [#1]
>[    3.305159] Modules linked in:
>[    3.305603] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.11.0-rc4 #39
>[    3.305988] Hardware name: riscv-virtio,qemu (DT)
>[    3.306140] epc : __ew32+0x34/0xba
>[    3.307910]  ra : e1000_irq_disable+0x1e/0x9a
>[    3.307984] epc : ffffffff806ebfbe ra : ffffffff806ee3f8 sp : ff2000000000baf0
>[    3.308022]  gp : ffffffff81719938 tp : ff600000018b8000 t0 : ff60000002c3b480
>[    3.308055]  t1 : 0000000000000065 t2 : 3030206530303031 s0 : ff2000000000bb30
>[    3.308086]  s1 : ff60000002a50a00 a0 : ff60000002a50fb8 a1 : 00000000000000d8
>[    3.308118]  a2 : ffffffffffffffff a3 : 0000000000000002 a4 : 0000000000003000
>[    3.308161]  a5 : ff200000001e00d8 a6 : 0000000000000008 a7 : 0000000000000038
>[    3.308195]  s2 : ff60000002a50fb8 s3 : ff60000001865000 s4 : 00000000000000d8
>[    3.308226]  s5 : ffffffffffffffff s6 : ff60000002a50a00 s7 : ffffffff812d2760
>[    3.308258]  s8 : 0000000000000a00 s9 : 0000000000001000 s10: ff60000002a51000
>[    3.308288]  s11: ff60000002a54000 t3 : ffffffff8172ec4f t4 : ffffffff8172ec4f
>[    3.308475]  t5 : ffffffff8172ec50 t6 : ff2000000000b848
>[    3.308763] status: 0000000200000120 badaddr: ff200000001e00d8 cause: 0000000000000007
>[    3.308975] [<ffffffff806ebfbe>] __ew32+0x34/0xba
>[    3.309196] [<ffffffff806ee3f8>] e1000_irq_disable+0x1e/0x9a
>[    3.309241] [<ffffffff806f1e12>] e1000_probe+0x3b6/0xb50
>[    3.309279] [<ffffffff80510554>] pci_device_probe+0x7e/0xf8
>[    3.310001] [<ffffffff80610344>] really_probe+0x82/0x202
>[    3.310409] [<ffffffff80610520>] __driver_probe_device+0x5c/0xd0
>[    3.310622] [<ffffffff806105c0>] driver_probe_device+0x2c/0xb0
>(...)
>
>
>Further debugging showed that, as far as QEMU goes, the store fault happens in an
>"unassigned io region", i.e. a region where there's no IO memory region mapped by
>any device. There is no IOMMU faults being logged and, at least as far as I've
>observed, no IOMMU translation bugs in the QEMU side as well.
>
>
>Thanks for the fix!
>
>
>Tested-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
>
>
>
>[1] https://lore.kernel.org/all/20250920203851.2205115-38-ajones@ventanamicro.com/
>[2] https://lore.kernel.org/all/20250920203851.2205115-20-ajones@ventanamicro.com/
>

Thanks,
Fangyu

-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
