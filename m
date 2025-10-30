Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A58B5CCF9E3
	for <kvm-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 20:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X8TVaQqhIowH86sXLG8va3FtZOt2z1DRerYMyzpeVZo=; b=3jsNiYpcMo7Z6J
	+e3UW9BuvSU2a1fezoMVMiuerb611pfRvBonkMv2Ag69duCQ+n3uQwpYIqvJF7KajlXqEMAYKEeZr
	69iZ3KkVlmxeB84/zMU0MSAWJi2urhaDAY7N5ysT7XLQcPXPnQGQ9Ig+RzcXxf+iyYQ9BxOuHUECT
	Y+W48b/47oM5Bit4a8iOidUYIsJkVXAO1cPYIWFIkVUO6ssA+CZjrOUUihqw12blTFJQOyrkEImQk
	xkdYT1JlgGmLk5mY1SnGCLHBc2Zrhsq5+UIpSdIxBlrnr6N0iG6QsjSCHn+hSr/3HT57fD0ahjRzY
	ymo/ppVtUWbq9Pn3JN/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYzY-00000004kvG-22fk;
	Thu, 30 Oct 2025 20:11:28 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEYye-00000004jn8-2wtO
	for kvm-riscv@lists.infradead.org;
	Thu, 30 Oct 2025 20:10:34 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-3407734d9a2so522364a91.1
        for <kvm-riscv@lists.infradead.org>; Thu, 30 Oct 2025 13:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761855031; x=1762459831; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=meKFn4T9FN95UHKOhoydSdUPWQIDJ02hjx7Eu38ytY8=;
        b=wY7EmhP7Rp5GgfxMMTpYAzx8DR1ft9E5IUJoWbvtivU0TP+5C9BlHJePGGa8bT9vgO
         zgRDsrZ21s1CIXAmetQdKTP0YcG4Axo/BzshMz0kcjckypvhK4E8xqOpWsCCrBnpce0o
         Tagwz/EZoY579aLGn4jomkQR2La7QG9ZhYxKY+E+WN/qJaCJ+VGXK/h7bTbotKFxygEL
         +KzFgx21cXMLbG0EyYL+L6HtASC8lzJ+Gb8LAfTAgX6Kd46AxhTE91iJXZ5b0V6z+yrm
         NYohJd405dncC8SN6HRNwX68zFRsoj9PSVXO6GuBMA8aDLYFQzslXGUeLaTGgbCezMSD
         /f0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761855031; x=1762459831;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=meKFn4T9FN95UHKOhoydSdUPWQIDJ02hjx7Eu38ytY8=;
        b=vtxIBZesUpwiObHw4icdkprmizhzmie/hapU0OBGOZn15cXz48WfV8Yf1uWVd33Qdr
         gyDe8XLWWJnv9qvOgCZD4+Uj+fUEdn1V7tG/kb6OgcUgw4L8P9TGnfSDbfNFN5WoQUGJ
         y+tit/U9mzyud0KTy4AmdtKHLBns1eAecV0xolLAs96yt0ToxdI+90BNpxBYaDgKjbqB
         6qyboaRwYcXQj30PexHNdLE9SrCydf2t6uqdMJEQyqAWY6ubZ+U19xc5jtvWCyH+UMIt
         s7EK6sILzPJey9Sw8R6he+GtljS/zjwyMVirDBNyuSHqefwnQQshqUIkMtAnmtkenAzz
         KBRw==
X-Forwarded-Encrypted: i=1; AJvYcCXbMUw8UVQNCJdUUQ4ZADtGNEfU/i/7QTYbzXPHjqFJ5Fh7uBSDN3tKdcUCdyaqefYzx58R/nA+0Qo=@lists.infradead.org
X-Gm-Message-State: AOJu0YxyIw6YzKjWBjPSLp7P1ojKD+OxKWCs/nFXLXcRB0sTpG8znDph
	xa26VSOGAm839lWeaat/MX5WYCyGBQ78Chl+HebAjqV5UOiBAwtxEPltLO3uMG7jcJ8Rx0vR37S
	xmppDRA==
X-Google-Smtp-Source: AGHT+IFHot6p8Ozw6sPTCEifBtpuZu56mTW8C+szZfak/MuPqOINRZqkxHegGZo0IYVURE2JpMgMqwrtO2U=
X-Received: from pjvl22.prod.google.com ([2002:a17:90a:dd96:b0:340:6aca:917f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2d92:b0:340:5c38:3a56
 with SMTP id 98e67ed59e1d1-340830a3a7cmr1392650a91.37.1761855030672; Thu, 30
 Oct 2025 13:10:30 -0700 (PDT)
Date: Thu, 30 Oct 2025 13:09:36 -0700
In-Reply-To: <20251030200951.3402865-1-seanjc@google.com>
Mime-Version: 1.0
References: <20251030200951.3402865-1-seanjc@google.com>
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251030200951.3402865-14-seanjc@google.com>
Subject: [PATCH v4 13/28] KVM: TDX: Avoid a double-KVM_BUG_ON() in tdx_sept_zap_private_spte()
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
X-CRM114-CacheID: sfid-20251030_131032_916244_A12B8715 
X-CRM114-Status: UNSURE (   9.97  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

Return -EIO immediately from tdx_sept_zap_private_spte() if the number of
to-be-added pages underflows, so that the following "KVM_BUG_ON(err, kvm)"
isn't also triggered.  Isolating the check from the "is premap error"
if-statement will also allow adding a lockdep assertion that premap errors
are encountered if and only if slots_lock is held.

Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Reviewed-by: Binbin Wu <binbin.wu@linux.intel.com>
Reviewed-by: Kai Huang <kai.huang@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/vmx/tdx.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
index 658e0407eb21..db64a9e8c6a5 100644
--- a/arch/x86/kvm/vmx/tdx.c
+++ b/arch/x86/kvm/vmx/tdx.c
@@ -1725,8 +1725,10 @@ static int tdx_sept_zap_private_spte(struct kvm *kvm, gfn_t gfn,
 		err = tdh_mem_range_block(&kvm_tdx->td, gpa, tdx_level, &entry, &level_state);
 		tdx_no_vcpus_enter_stop(kvm);
 	}
-	if (tdx_is_sept_zap_err_due_to_premap(kvm_tdx, err, entry, level) &&
-	    !KVM_BUG_ON(!atomic64_read(&kvm_tdx->nr_premapped), kvm)) {
+	if (tdx_is_sept_zap_err_due_to_premap(kvm_tdx, err, entry, level)) {
+		if (KVM_BUG_ON(!atomic64_read(&kvm_tdx->nr_premapped), kvm))
+			return -EIO;
+
 		atomic64_dec(&kvm_tdx->nr_premapped);
 		return 0;
 	}
-- 
2.51.1.930.gacf6e81ea2-goog


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
