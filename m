Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C5FFCD6E4C
	for <kvm-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 08:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9UrTIykByTMiqo5YMRacfrI3ipZ8FaNdC9PRzammN/c=; b=oaK9ULd3Ev28JM
	Dv5X7yHarpJ1DRYvletBjd3wYr2l7k065iPaN0yIIx9HjeUFKf3YCqQlthEPmAG+YHrRHePwQKecQ
	FRfYjRaU0TUUcUgx4U3ylJRPdmGTjKqiRprSDi1ktCQcZAVBh0w8a56Wm/8zt5CjGmnQV06oBhrWk
	44xXoU2mKk3QbJ2gBUaxhKCURtSvcGy4N/IOIeAginvW1VThwJErYWvio1kWiVUPMhHXahB6t9wT8
	IgaBMZAnF0n0m0MsorgQAtxdkRRAonkymVGFVQLQeC9MICOPlMdq12mI0xR/E8mc7/RwA5MDcmNnk
	QYMZMhYNf82FSHGVulYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyFi-0000000AOEM-0DpT;
	Mon, 01 Jun 2026 08:44:06 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyFf-0000000AOBp-10Oe
	for kvm-riscv@lists.infradead.org;
	Mon, 01 Jun 2026 08:44:04 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2be1dd4af34so145188645ad.1
        for <kvm-riscv@lists.infradead.org>; Mon, 01 Jun 2026 01:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780303442; x=1780908242; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xSRGQKpWCLbV+j0YDeovxMcfa4aON74s/dnTPwpNiss=;
        b=QcvT0NvwPv/3eu5g7f0uuRFN+Yl4N/v9DPSVXvQqKSPY6hoDVjVC0Zc64UipQfdAP3
         6C4heGdJdbJcfd0hgaGT81EtI0nMvZmY+ywj7SVxGcc+UMvPsx1G+r0hO/BzFesuYx1W
         SPT/ya7hooRqRpl+u+JLxc4ipXq/Xbc0y8oizWaN1/ZWyNPSx1Akt3dr0zS8F+wpY1Fa
         BmEGZleBJJYihb+AzziZnLrbd3Nd5i9HY5vYXiFeoKRpo7bzrULSzAQ+aU1CGNzLCODA
         G3TKG9gsoA2dY+s+Okk6ZH8t4Shw1N0HjO5T7j5cJ015/rCt4gO6xsxJBByk05GoGe8e
         Yp4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303442; x=1780908242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xSRGQKpWCLbV+j0YDeovxMcfa4aON74s/dnTPwpNiss=;
        b=Vn/yJtn8fmZVy1fIEknxiwz1wQnRAB+84agieGNdSZ/N//Ba0ms8dpSSUYprc2RRgc
         wQ8y3mfRaHs53C1aKEFzSQZIFRmmLBaNT2jWS7gk1o4d6tzf/SGkKuZFJWPLArIvKzEX
         yRwqq8e+JFNAsCJwW9tYnFVKRUstO+fa3jW0kneqdNVFYlauDOLbkcdSvRrcFYAanVhX
         9Cv9eBnaOprhKmO19x/tn80VXXJoEGv2hiJ2TcPF0y4CHqJoo8iOb2CP1C1FSRc0Q+4W
         gZgMGdD9oCyzYCHZ/0QQde5izwEFKwoUqwrHXEFcmA98bIBvVfyn+2rSNnA4LyfrujJm
         Giig==
X-Forwarded-Encrypted: i=1; AFNElJ9TWy+sEHa+gLxu+0rC0mDswnrXtE8SHj2POnNvbxUdJctFgLO2v6W6pEwdv8MraKbWZZVD9Nz8+ck=@lists.infradead.org
X-Gm-Message-State: AOJu0YyuEooI774t7UVVa6/ODc3INbpo9w5mxk3fR6segq7deamxRXf7
	MXZztZOYjtZLZ3QMy6EfFJskh8pVgiacmpRoX+FU7+U8BL+gWDVdxvjx
X-Gm-Gg: Acq92OFaUEN3nE85NkYGHB72VP+K9Ozvv4jOwAiriIyPhjOYs5RPpR3CIuaJBOoxJn4
	XTpcSVqY7SdNBA1/SpXe9rsnBlTcQI26vDlN3IjgaeDq5QQpcQd/VrOtFoNq2/bDuQ+hHIULYDx
	E5tjoSzcM6HVstl07ZoZxYi1pZ+iV+ZFg4ENDAdWQlMi+xLxXct97bpgXbqoIicB+u6wG2i9+WX
	rVHC8UXnhFuGZFxr/+m2/9IP8JeNvS0e8FaXf3wNNIvmt467XfRo8x0wKOq/e/HMifmYHqmO9Mg
	3eOsmbU6kP8hacJwtmjNf6zWfv4tVXR4FoWiki9oiirIhZgp00Shv+PuL5fqwSNr4gRHiVKmrXW
	ZK3Q7/Dn5Q7+cEDq/MokXW2f6b4nGFYHksoupAlSjQ4ghgimEA1TheipIDzR7NqNZXwm8pBOZsW
	BeCILg8++vy1IE8peNGP6V1Wh9lo1zS3JQSE/FHd8ELDp1
X-Received: by 2002:a17:902:ea12:b0:2b2:3bb6:fbf8 with SMTP id d9443c01a7336-2bf367aa3a1mr120210065ad.16.1780303442300;
        Mon, 01 Jun 2026 01:44:02 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c4dd4csm99949505ad.78.2026.06.01.01.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 01:44:02 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atish.patra@linux.dev>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Deepak Gupta <debug@rivosinc.com>,
	Thomas Huth <thuth@redhat.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH v2 2/7] KVM: riscv: selftests: add Svadu FWFT extension to get-reg-list test
Date: Mon,  1 Jun 2026 16:43:30 +0800
Message-ID: <20260601084336.2601675-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260601084336.2601675-1-inochiama@gmail.com>
References: <20260601084336.2601675-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_014403_310626_7493DD91 
X-CRM114-Status: UNSURE (   8.61  )
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

The KVM RISC-V allows Svadu FWFT for Guest/VM so add this extension
to get-reg-list test.

Assisted-by: YuanSheng:claude-4.7-opus
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index 8d6fdb5d38b8..d88edef77ccf 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -712,6 +712,9 @@ static const char *sbi_fwft_id_to_str(__u64 reg_off)
 	case 3: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pointer_masking.enable)";
 	case 4: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pointer_masking.flags)";
 	case 5: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pointer_masking.value)";
+	case 6: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.enable)";
+	case 7: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.flags)";
+	case 8: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.value)";
 	}
 	return strdup_printf("KVM_REG_RISCV_SBI_FWFT | %lld /* UNKNOWN */", reg_off);
 }
@@ -905,6 +908,9 @@ static __u64 sbi_fwft_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pointer_masking.enable),
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pointer_masking.flags),
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pointer_masking.value),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.enable),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.flags),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.value),
 };
 
 static __u64 zicbom_regs[] = {
-- 
2.54.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
