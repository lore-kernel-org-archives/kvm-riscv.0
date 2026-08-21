Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3963FC5DF81
	for <kvm-riscv@archiver.kernel.org>; Fri, 21 Aug 2026 03:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:References:
	In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jzmRAuEostn9VQdcXN4kpSylKEMJqtwHQgUxyW9zMx0=; b=sxGLFWgX/BsVzk
	gNRrSi+tvTJcbCFGDgJq2c/1xG4UixneO6Gp0ngNS98AiJ5JVFpa1cplwW6Pw18UKx1QolIbJ1HTa
	TtOGpOAUOq7yYimAdcZjjE6tfK+qktX6ZEbcZibNkV4b4P8eDHM1ndX+B+oTyTn2qXKwvkWuBhyd1
	B2FPpxTKxek35yuSj5kHA1R/zpzVKSjjMvBPmGqqv/QZF2K360tmGeiUjLaVSI0O6auDix+BzJD6o
	1+/sB/mCPfbUMRrGc3BrTsHYFx05mzrIzTBsOyMU/Tk5SwXdNXyXpPjJK5QIsa4iQmmQD4fOJv0ib
	mryJecLNoadpn0FERwlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxFvh-0000000CUky-1YfW;
	Fri, 21 Aug 2026 03:28:29 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxFvd-0000000CUkO-1UPt;
	Fri, 21 Aug 2026 03:28:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:From:To:Cc:Subject:
	In-Reply-To:References:Date:Message-ID; bh=SgIDj/Qoiw9IbD1da5NE7
	BBzdU3bJqbcJYLHQ4+hgrQ=; b=k4T1yIyyM+Nje8nZ3tl6IMPNaaK79nwJZAHr9
	3OP7a2ZBrBJdeoQIA+/ERJajI4BXxuYSZj+bZnmsEdV0iBeDP8ib4t9SRBRv+kIR
	42aZ2lkeHv7U4PPbUOYK+h47Pkqpo+bFca7erta/oQz6yX2t7xJiLLSAGdpOMjCe
	Q572EQ=
Received: from [127.0.1.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwCXxs3XxYdqA6EAAA--.189S2;
	Fri, 21 Aug 2026 11:28:23 +0800 (CST)
From: Xie Bo <xb@ultrarisc.com>
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, kvm@vger.kernel.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Xie Bo <xb@ultrarisc.com>
Subject: Re: [PATCH] RISC-V: KVM: Serialize IMSIC attributes with vCPU migration
In-Reply-To: <CAAhSdy3kDmRxcT_+dOpcUVAkvZ-F0kWdQett+mTy93gPDkwS+Q@mail.gmail.com>
References: <20260721073612.137259-1-xb@ultrarisc.com>
	<CAAhSdy3kDmRxcT_+dOpcUVAkvZ-F0kWdQett+mTy93gPDkwS+Q@mail.gmail.com>
Date: Fri, 21 Aug 2026 11:28:08 +0800
Message-ID: <178728288861.534500.12009100192281293732@ultrarisc.com>
X-CM-TRANSID: AQAAfwCXxs3XxYdqA6EAAA--.189S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYL7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E
	6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28Cjx
	kF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8I
	cVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r1j6r4UM28EF7xvwVC2z280aV
	CY1x0267AKxVW8JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE
	5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeV
	CFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxG
	xcIEc7CjxVA2Y2ka0xkIwI1lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxAqzxv26xkF7I
	0En4kS14v26r1q6r43MxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_
	Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwI
	xGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWx
	JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcV
	C2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbE_M3UUUUU==
X-CM-SenderInfo: l0e63zxwud2x1vfou0bp/1tbiAQAGB2qGcfoAPQAFsf
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_202826_095681_0041DCD6 
X-CRM114-Status: UNSURE (   2.76  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Hi Anup,

The issue reported by Sashiko has been addressed in v2 by using
mutex_lock_killable() and returning -EINTR when the lock acquisition is
interrupted.

v2:
https://lore.kernel.org/r/20260810-imsic-attr-race-v2-1-00ed95ad321e@ultrarisc.com

Regards,
Xie Bo


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
