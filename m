Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47782C43458
	for <kvm-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 09:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o4KFnP6W6P30qJ1t+ZWEyaLB7uAtc8Fr4iT5nryg3VM=; b=zoHuzD+8XDWQeF
	FOr70QGikFPFz+EfNRkKKEJH6oWXcOJVBtN/nVg2qhzkALkRKGro+oRccRFONm0lH9mJc4Z31YovU
	7Kjjlj5nCDyJbOEa5z5TNJKwr8GN4emayjK9Ba3ubktS1CYJ65HdlaVbIP6ifvhyovTRrCZH8owgE
	THKa76Aii9juqVDRBDWySiJ2xgwxpnKSme23tJIl01nKODx0tto/8l/VfXcG2BrIk52XYQ6GqL6Q6
	CcqDDbsq+LYuOXPu33AmocgKj0nhikP9RZ/7vF2k/E7w/7sHtLeIYs87SxFDVc8NH0VKDx44tbIXI
	BGfy92YmLDY7NUN5TuuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1werYE-00000001EJ8-3kBS;
	Wed, 01 Jul 2026 09:48:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1werYD-00000001EIY-3XNX
	for kvm-riscv@bombadil.infradead.org;
	Wed, 01 Jul 2026 09:48:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=MVL4Q3g2uFBrFhtqEHVihrv/zmgdiC+pHWdUndlTmlw=; b=oZYyTdLojwFdnpkyx5VfrLpo2X
	BO9J2gTX1u0TgGaC3bW2q9y3yQ8kMToSLRf6QGcFKKCMn5Wkzz2fdeIImCSJq7wWZBldVCurKY/t/
	LBzU6i4AWbT60oQkiG6bVNuCIJ7dG61JXt5XUmLiFt+cN3zI+BTuF2ECcYpylXxar/eWNG0vktcoF
	eTw8+5529GltY060tVG8b/sDAkIN1fn8VoIHzW2kREUit2oTAYtvuC+IkmhQFZUlLMEwld8SKrvNS
	Xs5WnJ1n57lqoI2Tf7zONDOA8lVJELeEhGT0BhhdrdW7y4KoHMWl3o+p6venK/WEQDVk9ijSeZLQO
	WnHYftbA==;
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1werYB-00000002aCH-03wG
	for kvm-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 09:48:12 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-c99eaa1f020so352532a12.2
        for <kvm-riscv@lists.infradead.org>; Wed, 01 Jul 2026 02:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782899288; x=1783504088; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MVL4Q3g2uFBrFhtqEHVihrv/zmgdiC+pHWdUndlTmlw=;
        b=Et1Ky2kMhaZUXItuWBeebag5XPf6KNX5+rPmcyS7J6uZ2foco+JBis6f2fv/kVU5bi
         YXsRTPGyviTaslAw2g0B7ULNAoD0G5fvK5SzioB6Sxv4i9bLV9Z8Hp2fE/iHPY7jqmGb
         eKph86mbb3NsEDZSaEUBflfSOa0olH0yiNYD6GYe/RkX9vSrJzOnDv15Hf2YLIlGbaoD
         dEmIIRD3v96qI8WN9EqMrcewwSF7m+v+XC60PshFzTWybhfnXp4XZ2y/PIYLhPfh4xhG
         ibJwqjI3P9czx7W1DW7oubAS7zvQRuFrgAay3TnTg0fT2BkHGzb4kK9saX5mG48LY1L5
         +3yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782899288; x=1783504088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MVL4Q3g2uFBrFhtqEHVihrv/zmgdiC+pHWdUndlTmlw=;
        b=tCbJ9Tg7ylU+ROaaf+pDigNaHK5qqbr1tFgaN4izagmVNZ1bEtz3xW+KA47tnWvofr
         JOR1HIIFiRaEHzJGcr15ZMwklJJ1EEdHnB5MiTPVUanOjxYkGm/u4Zx+7Ma/AfCSkMGv
         6vi0swA9h/MDKUDePJ/iRx9uglJdo48Z2SkhUhwJXokCbqpusbUjhdDqUr7Yf6+PGXjS
         KMLCALVkvfvkMg4T4VWViJhhmaKA2bdLdmnNfWKLczzdciNzDalbbSZnVHf3pOA4HvXB
         LNt0GHmb4+OVJjdeBUfpe/FE2056v/JM98oP/W/+Sv6fi0fb8F5D2yzhjOz/Zuj7FA1n
         fkDg==
X-Forwarded-Encrypted: i=1; AHgh+Rr7P6CnHGCpMJwbnV5Yj27XBjvzVmGhxGL4JB0blyS65yS1AmC4pUg7bzJowNShdDwp3POnUAC0fsw=@lists.infradead.org
X-Gm-Message-State: AOJu0YxnoJm125JNX1hWhu8PtQXyYR0+e0YqBYjeCht6kgpLR6mbTP3C
	MmuVQVfpSVTkj7kagT7c0wuZ+U8WyY3VYwiE3UDaw7fD75FEDX1agppB
X-Gm-Gg: AfdE7cnLlSgoAZsoARE3+b0RYgHf+WYUd0C6OXc1KcfHMPLqKIijri2ZmSGkCNU8jiF
	9BR4biAqabMEb0rDYFJlPLAzHnqIQV6I8PQpam5I2s41oEEfVBNuWDbaEg7pl2MSGnopRRAekl6
	R/HflbMQmAXklRmxg6cHfNIj7l93mxdvH7oFq7rsWxTlAzJGN/2avzDxC9dOHkgzIV2KLSdy5Jo
	LSLw7QOg7j97etWfFSntaVzqa3lC1jAxXOxVtXnSBb/cA23WI8AUrOqD2Iwd07sOmBFdmgx+CQ1
	6COphMl2zkG9negzPxARzSADgapr5zyg/AuCm7SenqjaZ6x7ZEJA8HUWjVBzF8zX0X//FILqbsb
	e7zBkJxmfkeSw2MUWZMno571tFEKQu15X1YHPyU0NZ955jNjybe4GQBz5SOdrnnsL7eDpZtdD7k
	gjS1h3sEM9Z/Q=
X-Received: by 2002:a05:6a00:9aa:b0:847:8250:2b2b with SMTP id d2e1a72fcca58-847c51a497emr24293b3a.52.1782899288038;
        Wed, 01 Jul 2026 02:48:08 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a0395a97sm3662539b3a.51.2026.07.01.02.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 02:48:07 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 3/3] RISC-V: KVM: Reset the SBI extension when disable it
Date: Wed,  1 Jul 2026 17:47:30 +0800
Message-ID: <20260701094731.1022163-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260701094731.1022163-1-inochiama@gmail.com>
References: <20260701094731.1022163-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_104811_227618_6122A647 
X-CRM114-Status: GOOD (  12.80  )
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

The SBI extension validation callback can only fix the parameter if
the extension is enabled. However, if the extension is disabled after
modifty some parameters, the state of the extension is still broken.

Reset the extension when the extenion is disabled so it can have
a clear context.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/kvm/vcpu_sbi.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/kvm/vcpu_sbi.c b/arch/riscv/kvm/vcpu_sbi.c
index b737e9a7a12a..3eb7b7c57059 100644
--- a/arch/riscv/kvm/vcpu_sbi.c
+++ b/arch/riscv/kvm/vcpu_sbi.c
@@ -221,6 +221,7 @@ static int riscv_vcpu_set_sbi_ext_single(struct kvm_vcpu *vcpu,
 {
 	struct kvm_vcpu_sbi_context *scontext = &vcpu->arch.sbi_context;
 	const struct kvm_riscv_sbi_extension_entry *sext;
+	const struct kvm_vcpu_sbi_extension *ext;
 
 	if (reg_val != 1 && reg_val != 0)
 		return -EINVAL;
@@ -229,6 +230,15 @@ static int riscv_vcpu_set_sbi_ext_single(struct kvm_vcpu *vcpu,
 	if (!sext || scontext->ext_status[sext->ext_idx] == KVM_RISCV_SBI_EXT_STATUS_UNAVAILABLE)
 		return -ENOENT;
 
+	ext = sext->ext_ptr;
+
+	if (!reg_val && scontext->ext_status[sext->ext_idx] == KVM_RISCV_SBI_EXT_STATUS_ENABLED) {
+		if (ext->reset) {
+			ext->reset(vcpu);
+			vcpu->arch.csr_dirty = true;
+		}
+	}
+
 	scontext->ext_status[sext->ext_idx] = (reg_val) ?
 			KVM_RISCV_SBI_EXT_STATUS_ENABLED :
 			KVM_RISCV_SBI_EXT_STATUS_DISABLED;
-- 
2.55.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
