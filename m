Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A05FFC54F51
	for <kvm-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 12:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HVHsThmsC1FC/RFABCzk6LOthuorTiRc4YLLaNHgASY=; b=uesoxwIJNAV8z2
	nLIUvIRQbVsDzqBNq75xKS6gIwjeoJm841yyiutWvIZdJu11KgbQ80AbGEVPC/jYAf1k/emTSZ7gs
	I7tNWnvM8w5g5FyNVkBfC43yk2dFMQKD2FQuj4H/wKjgXPeO438BFb3wytpFhLhskd2bqvap6SxOY
	vW5t5F0PX8k3AUb5YEzl2kN95tYMQJBtCxLzzskAN1Nb+gscQHGCKpopbyXmp7M/Z6X6cPjgIzTJy
	gFwaAUd3ZKZzAGd3KaMRIj7pZZtI1F6yBklmrfa7U/sFOnHvvWqfSTDdAcwz19mryKjLLnPi3kXCV
	Ze23h9+K7JvEaospLfoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp34a-00000007pOf-1JUP;
	Wed, 29 Jul 2026 12:07:44 +0000
Received: from mail-pz2-x00.google.com ([2607:f8b0:4864:3b::])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp34W-00000007pN9-3Y94
	for kvm-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 12:07:43 +0000
Received: by mail-pz2-x00.google.com with SMTP id 41be03b00d2f7-ca24d39d8a4so388575a12.1
        for <kvm-riscv@lists.infradead.org>; Wed, 29 Jul 2026 05:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785326860; x=1785931660; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qLMnpNtLpsL2XHYkd+z33mKUcr79GQx5LDeNnSKUE6Y=;
        b=q1F+BVkWYnzVDeqQiC/zxrtHNKy8qwAXio8DVKRwnMjU6kpCKGvv4TJNM0k29Tq/C2
         VDhiaMh+m7U1hTlXmBXwW4cjAQj/Fc5HbSdEXtydEHzsCf1VtzPTd4kRpr2kh4AXg7H2
         h1Evu+PfxfprUdFRKLUzikme7BB11SufSegnYWEwjw5V0+jvNajXwR0QzjdnFUr6PnCP
         X+YeXX7ByDw7qGskGojV2zdqJByBUozLLcIp55NdeerqDm4Ei0GHac60fEbhrdsvruCy
         Ue4HGWfP+HrGa+GKaa96YOMhznKMntc6QiAX4Mn8yVp0OGWahuYpYeeUs4KcfX3NpEtI
         2fTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785326860; x=1785931660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qLMnpNtLpsL2XHYkd+z33mKUcr79GQx5LDeNnSKUE6Y=;
        b=kiijGTgYO2z4DoOAhr6KX8WmCdDrBoX6dDy6EyJbFnpMJPzjvNuYEm66xDUd7XUiyK
         kBOorLtaTYl5U6cWrHNfk1heZDq5LlDggb91jdoUQL1YO+ld0gV8ra4gwLL5xb2EbM4s
         xBCtbYpufx9hWWaaLNl+4rE3rDFPSa+rzJ7a92UTA79pypYukHTbn5x+EOJUS4GD9tMP
         qEZFBEY1alh/rkGY6Wjcc8ulbXXX5+N6/cB9Ps/W7p5IVSN07eUXAk2YEXqqIsNYmOSf
         4GPzvxV6gltohKeTzksfmGIxyN9pfqOKuR7kzzAkuoswihTxi1xsvuQTgET/Vb890Z75
         gknA==
X-Forwarded-Encrypted: i=1; AHgh+RoXj0d2YIcjIlHczA1874X3/nO6Yw8+hFF9Nf1a3dLjc6m8KIO+CpGSFZOrdsWjCsDyFRAerwc7WG8=@lists.infradead.org
X-Gm-Message-State: AOJu0YzvZvnS2UO76Km4a5v2NNJXnIITf2E0qViHHjRNPsGFCDEzZUrv
	oBRpE1NyQOqMoWBHu81WxQrTPthD5xv8YgrQk5kBZ7fEObxo1hnR7kfl
X-Gm-Gg: AR+sD101mfC1pkJK9rwENsA5MSi+wR8wqt2w1WYF1FkyWO6bALWY0MZOo4PQjTB0z4a
	H/kXmddSPNT3EcjJjBEhcHbg7XXpxcmVZysX5Gz0Dgw61+nD1fl8DjqpXs0dIcq7XhjNOePEFIV
	UST5EOx4yV2aK4K+5a7UDJXtS2dm9+LsErZW0i7Htf8ohw8/1P/lBXvdZox2fJXQ5MUzlQqMgP7
	eQE2b529RsngAv7/C+rHPjuduxHFMJ8mQ54ysN4Gq9lKKxM+Ja0xxM0WkCiJeRpwJAoKMg8xW3n
	V8bU60X/H/qbuBWs7jGNwLU2v4s98ih8fYQSVUFCi1bfC5VmY6AGzhWqfCkbV+1hIQUa+6O50E8
	LXMOThdsiU2mnItkHrxyn5uMBa2r7MIto52iv00B5mX7FqPMCQ22SOgzDGEzj+Yejk2Huy5zxWM
	7PB3X2vrQBucdOvGtnttSKOZMaSra7eF/y47g/gTa6wTa+6bwEZpubEk6CmGdY1gx9UfZbkqjLO
	IQ0JSaJ4ny7M/4=
X-Received: by 2002:a05:6a00:ab8b:b0:84e:165:da58 with SMTP id d2e1a72fcca58-84e933cefd6mr6852509b3a.52.1785326859904;
        Wed, 29 Jul 2026 05:07:39 -0700 (PDT)
Received: from q-System-Product-Name ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84ea0055133sm1309570b3a.18.2026.07.29.05.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 05:07:39 -0700 (PDT)
From: "Bingyu.Xian" <shanbeeyoo@gmail.com>
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Quan Zhou <zhouquan@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH v3 0/3] RISC-V: KVM: G-stage fault path fix and cleanup
Date: Wed, 29 Jul 2026 20:07:30 +0800
Message-ID: <20260729120733.829457-1-shanbeeyoo@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260729075230.743030-1-shanbeeyoo@gmail.com>
References: <20260729075230.743030-1-shanbeeyoo@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_050740_878352_F6E3D8DF 
X-CRM114-Status: GOOD (  11.98  )
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

Three small changes to the RISC-V G-stage page fault path, sent as
separate patches per review feedback.

  1/3: Treat -EEXIST from kvm_riscv_gstage_map_page() as a quiet
       success, aligning RISC-V with x86 and arm64.  Real bug fix;
       Fixes: 9d05c1fee837, Cc: stable.

  2/3: vma_pageshift: short -> unsigned int.  No-functional-change
       type cleanup in preparation for sharing a common
       struct kvm_page_fault across architectures.

  3/3: Widen the G-stage fault address to gpa_t end to end -- the
       local in gstage_page_fault(), the (gpa_t) cast before the <<2
       shift, and the fault_addr parameters of kvm_riscv_vcpu_mmio_load/
       store().  This completes the RV32 34-bit GPA fix that v2 only
       half-addressed: v2 widened the local and cast the shift, but the
       address was still narrowed to 32 bits at the MMIO handler call
       (unsigned long parameter), aliasing accesses above 4 GB into the
       low 4 GB.  The handlers' internal uses (run->mmio.phys_addr is
       __u64, kvm_io_bus_read/write() take gpa_t) are already 64-bit.
       Also in preparation for sharing a common struct kvm_page_fault.
       No functional change on RV64.  Not Cc'd to stable: RV32 KVM is
       unsupported and this is untested at runtime.

Changes since v2 [1]:
  - Split into separate patches per feedback.
  - Completed the fault_addr widening v2 left half-done: widened the
    kvm_riscv_vcpu_mmio_load/store() fault_addr parameters to gpa_t so
    the 34-bit address is not truncated at the MMIO handler call.

The KVM_MEM_USERFAULT port that motivated this cleanup will follow as a
separate RFC.

[1] https://lore.kernel.org/kvm/20260729075230.743030-1-shanbeeyoo@gmail.com/

Bingyu.Xian (3):
  RISC-V: KVM: Treat -EEXIST from G-stage map as success
  RISC-V: KVM: Use unsigned int for vma_pageshift
  RISC-V: KVM: Widen G-stage fault address to gpa_t

 arch/riscv/include/asm/kvm_vcpu_insn.h | 4 ++--
 arch/riscv/kvm/mmu.c                   | 8 +++++---
 arch/riscv/kvm/vcpu_exit.c             | 5 +++--
 arch/riscv/kvm/vcpu_insn.c             | 4 ++--
 4 files changed, 12 insertions(+), 9 deletions(-)

-- 
2.54.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
