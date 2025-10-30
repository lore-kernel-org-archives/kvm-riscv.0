Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCEF5CCF9F0
	for <kvm-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 20:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tMsvXt36clINx2lZ4jLL4UuFuFTz1vKiZ6ky9t5ke7g=; b=CtcRYo6pA26qVw
	ugVzOWUwCmPAd8TEBHDcTd9pkz6cFKkIiGw3+VJFeZMzuFcmYivyoe+PIsiZ89CirQlYYv4+9+ifD
	NIvLRJ5Ocz2aF0OKH/Ycd/wa9QHd7Bd0mNQzkNGyaE2Rw/KXeC64xa21FoGVk+63WMbz/JQqv3uPT
	PxBz/3h8tthLknLc2Lyy4/BuAIEimZPziFGSwQ2dKDRoE+8CtentkxvQ0AZGrhtPuBscOGx4J4j5O
	uPvIOKCc87lJ/FUlGB1s1Hx3zImqPHY6snUSGczfcvhLypDKa+5U5DPSeWknNEn7+xJlVnTlBjBOC
	R9ijVj9r+AiV3e3CzWSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEZ1D-00000004msE-2Y12;
	Thu, 30 Oct 2025 20:13:11 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYz9-00000004kOS-3C0l
	for kvm-riscv@lists.infradead.org;
	Thu, 30 Oct 2025 20:11:05 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-b5535902495so987777a12.0
        for <kvm-riscv@lists.infradead.org>; Thu, 30 Oct 2025 13:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761855061; x=1762459861; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=pcGBUMDBt4QrK3gZ63mWxwFVf8xhoPzw9YjzqkGrLic=;
        b=b703GA/E8PtIs05hWhPCR1jcdMNJO5InhVcg1ldPhoL505z/yZT+L3dbzq0Tcp7mF+
         qQKI56SERUpbbKzDQ53LmDBAEDmEMTdxC4sfdpfV+Rypmhnyb3oQiRR7jSVet3SGUmM3
         wECS8GMcuPBJ1npNQeD2oTw8Y0nU8o/qdtVl7Ojk2lF+0sKrvMaH+4QeZWzGZf+WxDGT
         DQ/p8q3PRcfty36zIeEdHGN2WFu174duw/IicQcvCawEBAKcLl//PQtpV5Pq+o4rCfMT
         FM+crICHNj2Vp8+pHKdz5LRK+ulwDXGcyNT4HGJVPZoT/4cniZW5zJUeSc4aUyq1+q7u
         Ffew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761855061; x=1762459861;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pcGBUMDBt4QrK3gZ63mWxwFVf8xhoPzw9YjzqkGrLic=;
        b=nWoHTFDL8/qQJkZ3tfntwYVvHTCJWbdQY8ZQ+Bq51GLGRNj8ICtKL8RfzWRrLNjR6b
         cT5C5Xysrlbj+qmml3S9/gOd9De0Y/aXOjER1frCcizbgbRVOWWkmSppMRpVrvEnO0XL
         td3mPsmN+Ltx6e10W5qwvKmIUSen9Qz5NiYREkfFZR9ue9uizR6jd6QGYcPjfsCgs/YD
         CNJQD1AtJD2uzq3VjvdObYwNDqd3KsefoSPhlrWPILafF/bZNTSyN8sc8DCYVotdUCGk
         9bkcH1CIevJcxjCivHCyNFg4V2KebE4duWBqDWB82HlWsyuf2Hb3V0iweAzhGX+rGGhU
         0dYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVK0mxlIz5yzYqXbvsJOpV1k5N3zTp5wTm2WT+/DC3T3yHf6+7Tk/mY2tByDzIGq9unCTiHytMEloY=@lists.infradead.org
X-Gm-Message-State: AOJu0YxGjujIAOTU9sezEIVW0nCs7gTJxTNpJShr52Z8hRxgQqwBWVLc
	X1xXLD6FYD6sLjeesdRbWs7wc5OVQhzUeCLpmGRL/HnhVIs18+gGP4+TrFvCXN5wiIqvvi6xoWi
	ZFJyrIA==
X-Google-Smtp-Source: AGHT+IE/OfQCQRYqXElzN+OeKvwnTKdqn8Aa5qkU15JwMNXReTeV5Yh/81ZcfUEIC9p/s1OTRodzv1oDE/0=
X-Received: from pjbms9.prod.google.com ([2002:a17:90b:2349:b0:33d:69cf:1f82])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:c401:b0:295:21ac:3540
 with SMTP id d9443c01a7336-29521ac3a29mr3509295ad.33.1761855061339; Thu, 30
 Oct 2025 13:11:01 -0700 (PDT)
Date: Thu, 30 Oct 2025 13:09:48 -0700
In-Reply-To: <20251030200951.3402865-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251030200951.3402865-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251030200951.3402865-26-seanjc@google.com>
Subject: [PATCH v4 25/28] KVM: TDX: Don't copy "cmd" back to userspace for KVM_TDX_CAPABILITIES
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, "Kirill A. Shutemov" <kas@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, x86@kernel.org, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Ira Weiny <ira.weiny@intel.com>, 
	Kai Huang <kai.huang@intel.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	Michael Roth <michael.roth@amd.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Vishal Annapurve <vannapurve@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Ackerley Tng <ackerleytng@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_131103_935030_E337FAC0 
X-CRM114-Status: GOOD (  10.27  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Don't copy the kvm_tdx_cmd structure back to userspace when handling
KVM_TDX_CAPABILITIES, as tdx_get_capabilities() doesn't modify hw_error or
any other fields.

Opportunistically hoist the call to tdx_get_capabilities() outside of the
kvm->lock critical section, as getting the capabilities doesn't touch the
VM in any way, e.g. doesn't even take @kvm.

Suggested-by: Kai Huang <kai.huang@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 037429964fd7..57dfddd2a6cf 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -2806,12 +2806,12 @@ int tdx_vm_ioctl(struct kvm *kvm, void __user *argp)
 	if (r)
 		return r;
 
+	if (tdx_cmd.id == KVM_TDX_CAPABILITIES)
+		return tdx_get_capabilities(&tdx_cmd);
+
 	guard(mutex)(&kvm->lock);
 
 	switch (tdx_cmd.id) {
-	case KVM_TDX_CAPABILITIES:
-		r = tdx_get_capabilities(&tdx_cmd);
-		break;
 	case KVM_TDX_INIT_VM:
 		r = tdx_td_init(kvm, &tdx_cmd);
 		break;
-- 
2.51.1.930.gacf6e81ea2-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
