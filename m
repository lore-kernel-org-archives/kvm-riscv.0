Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0102C5AD5A
	for <kvm-riscv@archiver.kernel.org>; Wed, 12 Aug 2026 05:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=G8NfVxFCrGrPG9zJsEBvV/L4ZzyHdG0SiHVwvA9O18o=; b=fg5OkMY5+8qDQa
	hMsR66CXqr3/7D9oD87uvWrCNoDpJLwxE0VkreWrm0BfvK5n8YBgOKtH5q1f2ECz0uJIZdK+uZp7G
	UTWQ1cPyML+z8Z+pjlybtYef1sZnrW1UbA2LwvG80RriuWp1AR7pcQijyCsR6RFnfp1gYNNIHtOnL
	2AiE5GV9nMssv0bWRRvSYjVVKDDXAcWb84gMHTSjxgFAZOrgLQsEiUP5KEcEYMVVUd2jaR90sqvxq
	2+yV78z/OWBCHPBIQQuHRAmhke6qXzxDYnXptI2ZOmy5v+X+mKkcVjhd0S8pjL1chCqjHJrYCac44
	FDoSqM6MhRkcKC+hVJQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu1gt-0000000FRZd-3IyM;
	Wed, 12 Aug 2026 05:39:51 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu1gq-0000000FRXr-25pd;
	Wed, 12 Aug 2026 05:39:51 +0000
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-05 (Coremail) with SMTP id zQCowADnVD8UB3xqybQxBQ--.41533S2;
	Wed, 12 Aug 2026 13:39:34 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Nutty Liu <nutty.liu@hotmail.com>,
	Guo Ren <guoren@kernel.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] RISC-V: KVM: Validate AIA MMIO ranges against GPA width
Date: Wed, 12 Aug 2026 13:39:30 +0800
Message-ID: <cover.1786512671.git.pengpeng@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: zQCowADnVD8UB3xqybQxBQ--.41533S2
X-Coremail-Antispam: 1UD129KBjvdXoW7XrWfWryxCF1xJFyrJw4ruFg_yoWkGwc_ua
	sY9a45Xw18WF4vqa43Kr4UGrZ5W3y2gFy7AFyDAFWxGryDXr9Iga1kKry8uFyxu3y5Ar1D
	AryS93WSywnxKjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbVkFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY
	04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r
	1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
	b7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
	vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAI
	cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kf
	nxnUUI43ZEXa7VUbGQ6JUUUUU==
X-Originating-IP: [111.196.241.250]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_223948_910629_92FA25C9 
X-CRM114-Status: UNSURE (   6.14  )
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

The AIA device API currently checks only the alignment of userspace-
supplied APLIC and IMSIC base addresses.  This can publish a wrapping
fixed-size MMIO interval or one that lies beyond the selected stage-2
guest physical address (GPA) width.

There are two points to close because the GPA width is configurable:

1. Validate every complete range when it is stored and again immediately
   before AIA initialization publishes the first MMIO device.
2. Once AIA initialization has published those devices, prevent the GPA
   width from being reduced below their addresses.

Both initialization and GPA-width changes are serialized by kvm->lock.
The series was reviewed against the RISC-V KVM queue at
dfdf1374fdeccb5b7e3d35186228e01ec5ea5f01.  No build or runtime testing
was performed.

Pengpeng Hou (2):
  RISC-V: KVM: Validate AIA MMIO address ranges
  RISC-V: KVM: Disallow GPA-width changes after AIA init

 arch/riscv/kvm/aia_device.c | 79 +++++++++++++++++++++++++++++++------
 arch/riscv/kvm/vm.c         |  3 +-
 2 files changed, 68 insertions(+), 14 deletions(-)

-- 
2.50.1 (Apple Git-155)


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
