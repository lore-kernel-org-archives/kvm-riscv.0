Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD88C44506
	for <kvm-riscv@archiver.kernel.org>; Mon, 13 Jul 2026 06:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HGUKs2clIHDYGARRB6JEUZ5Ckus4HfBc8fo/vgwwtyo=; b=hWxOzUHROw7+0t
	gADIbP6+fk5QfMYaarDvgcNCERMUlggzKnjgY/VtW0kjF+XhK7vxYFEdSk7D/LOSQjJJ3tjxIyyKJ
	LHiDOtmKAqqrjA92pxNMxgDvSXMZyTk+OgvITG3IRawtbdJDKmkYLaQsUznEtrBte9K/mbn4yIjnN
	bSml579ZAeHZY54XIp/9/ZnlaAsSa+9C2htSMBlAapDO5zTLN13HbG5ar++QFvy7WpSvxSRfh9JcS
	PAfIMukoEr6qcfN79wNR6yRd3fTNpl4npSLeOrUFoEvltPNEYGM3yqkuFfLtRsIxJKveo6J/jqTbm
	2wcP27hCKUNRRmDaCSSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjATR-00000008Iw1-1uPq;
	Mon, 13 Jul 2026 06:49:05 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjATO-00000008IvQ-11fp;
	Mon, 13 Jul 2026 06:49:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=RT5+wPpAl4iGgnsOvf4B4+nW8I0T9Bewcc
	bYyASGIJM=; b=SXyihkrhkelFqNAZwMW26Duz44LPCmx9msIr19v2BN4T/HcpE/
	ujQ5uiJ1rY8/i/WwdvqPy0Oko+eBq3a7uttYuEBehDk0ioT+WyavuEIepLeOKz4c
	Z7U3MwdEfXK+KStM/aKSRhDD4ITNxgqBkVImByIfAuiTxGDdxsPFQTC+s=
Received: from ur-dp1000 (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwA3cUJOilRqfnsQAA--.16812S2;
	Mon, 13 Jul 2026 14:49:01 +0800 (CST)
From: Xie Bo <xb@ultrarisc.com>
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Alexander Graf <graf@amazon.com>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Xie Bo <xb@ultrarisc.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix lost virtual interrupts during IRQ sync
Date: Mon, 13 Jul 2026 14:48:14 +0800
Message-ID: <20260713064815.1276212-1-xb@ultrarisc.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <CAAhSdy3_YnzNiSE=KykriwSWU8X2CLhdr2E8CB=32JxA_L7caA@mail.gmail.com>
References: <178159067899.108868.8176174463274678253@ultrarisc.com> <CAAhSdy3_YnzNiSE=KykriwSWU8X2CLhdr2E8CB=32JxA_L7caA@mail.gmail.com>
MIME-Version: 1.0
X-CM-TRANSID: AQAAfwA3cUJOilRqfnsQAA--.16812S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYG7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E
	6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28Cjx
	kF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8I
	cVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r4j6F4UM28EF7xvwVC2z280aV
	CY1x0267AKxVW8JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE
	5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeV
	CFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l
	FIxGxcIEc7CjxVA2Y2ka0xkIwI1lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxAqzxv26x
	kF7I0En4kS14v26r1q6r43MxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_
	Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x
	0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8
	JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIx
	AIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbE_M3UUUUU=
	=
X-CM-SenderInfo: l0e63zxwud2x1vfou0bp/1tbiAQAHB2pUYNAAEwABsd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_234902_775202_8E6829B5 
X-CRM114-Status: UNSURE (   3.00  )
X-CRM114-Notice: Please train this message.
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

Hi Anup,

I have addressed all three suggestions in v3:

- use non-atomic bitmap operations while holding irqs_pending_lock;
- hold irqs_pending_lock across the AIA sync, flush, and pending checks,
  with lockdep assertions in the AIA helpers; and
- protect kvm_riscv_vcpu_has_interrupts() with the same lock.

I also rebased the patch onto Linux 7.2-rc3. Both RV64 and RV32 KVM
builds pass, and checkpatch reports no issues.

The v3 patch follows this reply.

Regards,
Xie Bo


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
