Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF480E77180
	for <kvm-riscv@archiver.kernel.org>; Fri, 13 Dec 2024 11:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J7syKuXKYn4RIv3eLqVrpAcOAIevixqOpZYk+trtans=; b=K6d4m2M2sBi+gm
	gcpo1Olpk28e/ZlW8ToJHzwy7VldQNeJUFSNwZoWq/drbZYV42Jh8Z9I2I2b7bbTK6pK1IlpxHuQD
	DtHDIlEPEwk7GjAED910EucbTV8BtuLxDZ7nnlsH5DM+d7/VNFHbC6F1utsMapb+r0IqNvixGNGcg
	cR8xZ+EH3Gq/EvC+FqxeA6M0e4l48PAB2RsghyFbOtujnD3/+LcKloatkowpvy4812K0RFwA86oUw
	0eNnL1u/zyvOcHRsz9blE1X6hs9pIQjZ3Ara8/BtVlbYIsZo+rNMkuiqPa2VQ1BpUlAyB9Ca7Dmt5
	ruOkiHoBgZudUjmFb+nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM3vC-00000003a16-2oge;
	Fri, 13 Dec 2024 11:33:26 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM3v8-00000003ZxI-44r0
	for kvm-riscv@lists.infradead.org;
	Fri, 13 Dec 2024 11:33:24 +0000
Received: by mail-pl1-x641.google.com with SMTP id d9443c01a7336-2166360285dso15432605ad.1
        for <kvm-riscv@lists.infradead.org>; Fri, 13 Dec 2024 03:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1734089602; x=1734694402; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nuxCIDMe8qbaOgSvtMiepAGljhokMOIMslTwK0Fvg2s=;
        b=GJkofLKRHCjEbsHEnKt45zn8bebL+HB4XVcOenxKaWQriOHZwYKZtXpCyqQeVTC2cJ
         YhwHdNW7amGwAS3WDuFC5EEkgHbEzoHIj/yDijQkwYF4dKWgKR4iQ9nNs0LQfpE8CljY
         ihsEo2re5AjT5tpS0BDFpRGOOZlsyJA2FjvSZR6Pun4axiF1+OOs85+brKRle6U58nHC
         KOIULZNwa0ck36RP+Y4CdcxkLsOUZUl4y0fLySklXSZ1V3v4jahMgf/ZL0ksQ6ueBWb1
         EYaeBLGBECHAyuby76cwhwr9FkGGY4qPYaOG8PswiB1w/w7DhQjxEvhF2xN919e93Udj
         gHbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734089602; x=1734694402;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nuxCIDMe8qbaOgSvtMiepAGljhokMOIMslTwK0Fvg2s=;
        b=JY/3iRH5AQHwPgUJyKXiiIIvA0i5CuzOQMG1o1MeFHEsobnMtyj973Xm9/0HNDCzaN
         2lvnM9mDXGy/Jq5dgjzgUMaHHCaWQz4Z/dnnPLw3aV05KMLVd6hYBFGFeRPFD9wB1NYc
         EeAO6AREk+IDwFUkKd9U82F3iwP/zII2dLmagW7/ikobHt3qDq5oPVUtzgBZOf2SvF4i
         HvlMjLWI/IL3/bvpftNL/0pgszymTfmXCacpQonrKR41EsZbeMhYvX1TMT2+4WI4WbXe
         RGlv/yAxEMpigfDwNVg3l8symSOv7emg5B4qnjM3e26f/g77dlv4Kcw50u6NH57GQz3R
         jnjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWO2jJ3Oop2it5cuGSDLIssz3hTg9T0/NRJ3kzECVwSaf1Pr/XxY6yfPipiuobpQBcZpfvJVAlj1Fk=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxfu12xtSXeWifwAJD6CBk2vbeA4k4V+ZnH4yPciYO6LUucNHDC
	6Qwa1MI0cbJvMeuU0oPQvxJrMw6/vJzBEfmMWrKzcYJXLj+I8GGWAf1THYgpB0k=
X-Gm-Gg: ASbGncthQu+4jQKM52KLFVzDtpXz0IYAHZLJLPrR4fSKoUFcpMXeA5MVegLZQ3SA9NU
	whAej87UQ2z95deTFcRuHqWOI+eyvAL8OEBINdSpUXA8CtzSwEHq+Lu76QE4Tyb07+92to8tUx3
	TsufpjDSI0hm92YBBt/W0Dp4FamWladrcL03wSCOol/vu7iJyRzrCrkHoiV0gJxbZ8QJZaxOvX4
	SFZtfosivGEOzSTgDWKxaKi8EW0hhI8hNH0d3N4xbKz8867GYQiVcg=
X-Google-Smtp-Source: AGHT+IFZ6i4b8fOxVCmjx+lwckw8Xv1f0ANQiCeNQYxiBu6aqzxk8+O3BUIvgfb3ruaR891H/Kr1qA==
X-Received: by 2002:a17:902:f68c:b0:216:48f4:4f1a with SMTP id d9443c01a7336-218929c3556mr29884975ad.16.1734089602210;
        Fri, 13 Dec 2024 03:33:22 -0800 (PST)
Received: from [127.0.1.1] ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21631bd2c2dsm103327125ad.263.2024.12.13.03.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 03:33:21 -0800 (PST)
From: Max Hsu <max.hsu@sifive.com>
Date: Fri, 13 Dec 2024 19:33:08 +0800
Subject: [PATCH RFC v4 2/3] riscv: Add Svukte extension support
MIME-Version: 1.0
Message-Id: <20241213-dev-maxh-svukte-v4-v4-2-92762c67f743@sifive.com>
References: <20241213-dev-maxh-svukte-v4-v4-0-92762c67f743@sifive.com>
In-Reply-To: <20241213-dev-maxh-svukte-v4-v4-0-92762c67f743@sifive.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Max Hsu <max.hsu@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3057; i=max.hsu@sifive.com;
 h=from:subject:message-id; bh=LdPuysx21Ofb0xvFzV8QxmW+nt/zKZ5xS3FFhbJOK4c=;
 b=owEB7QES/pANAwAKAdID/Z0HeUC9AcsmYgBnXBt3eMXow98+LeyNOGLt9sRJUeftUptMMHTfr
 LOMd2baOgWJAbMEAAEKAB0WIQTqXmcbOhS2KZE9X2jSA/2dB3lAvQUCZ1wbdwAKCRDSA/2dB3lA
 vaLCC/96w2hpgaZxW2gTD9xyx+m6UFTOHkHPCwOB9gPWzgxY2+SUx/wcYgE/0qnki6dxvO1o6+N
 a/HfwfIcN+EIHHdaN7OYoZvY0uvVQ/DCw0dH41jsZwrYVsQ3KxwlVEsAFx4LJwxQrNy8LdY60dJ
 JxZEVae+hLwZeVx/SUSvJzOaJ4L27NOpqHYHY65QgH7ZIKK9GA1ZygKrV1g/kKvSmfzH3Ad56xm
 JW7gvRfQrEpDAxOlc1vr2GwzlrbbrrfWgli5HiqmnFqVQZ6SyodaYuY6N+TDzBm/Knwy8HtrvRP
 QU2/h4B2NbuNNfAsfVFFo/oySwbEsxhnRR7oYGmSWgNt6eDsGZVZiW9y7XGlv5pNhpHDsYvGqNA
 e7GIv9NuLmxirqBSseZQ+C9Yd7W4q2oSdG/LNp9IEmI1zoGDGRB/TZByvI+6Kj6iww3XACvuVc6
 NeyaIAIonLUhLS4GCs9hP0CITzjlY4DKMbut0ZR/t+ZgzDaGKMhdbgQ1KVicEZ4VP+6Jo=
X-Developer-Key: i=max.hsu@sifive.com; a=openpgp;
 fpr=EA5E671B3A14B629913D5F68D203FD9D077940BD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_033323_015055_D78E0C93 
X-CRM114-Status: GOOD (  10.77  )
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

Svukte extension introduce senvcfg.UKTE, hstatus.HUKTE.

This patch add CSR bit definition, and detects if Svukte ISA extension
is available, cpufeature will set the correspond bit field so the
svukte-qualified memory accesses are protected in a manner that is
timing-independent of the faulting virtual address.

Since hstatus.HU is not enabled by linux, enabling hstatus.HUKTE will
not be affective.

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Reviewed-by: Deepak Gupta <debug@rivosinc.com>
Signed-off-by: Max Hsu <max.hsu@sifive.com>
---
 arch/riscv/include/asm/csr.h   | 2 ++
 arch/riscv/include/asm/hwcap.h | 1 +
 arch/riscv/kernel/cpufeature.c | 5 +++++
 3 files changed, 8 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 37bdea65bbd8a1a313cc7ba00b80fc5071b9809a..aeb62e9901452f8ded56961ab31dabbb2fd22cc6 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -126,6 +126,7 @@
 #define HSTATUS_VSXL		_AC(0x300000000, UL)
 #define HSTATUS_VSXL_SHIFT	32
 #endif
+#define HSTATUS_HUKTE		_AC(0x01000000, UL)
 #define HSTATUS_VTSR		_AC(0x00400000, UL)
 #define HSTATUS_VTW		_AC(0x00200000, UL)
 #define HSTATUS_VTVM		_AC(0x00100000, UL)
@@ -204,6 +205,7 @@
 #define ENVCFG_PMM_PMLEN_0		(_AC(0x0, ULL) << 32)
 #define ENVCFG_PMM_PMLEN_7		(_AC(0x2, ULL) << 32)
 #define ENVCFG_PMM_PMLEN_16		(_AC(0x3, ULL) << 32)
+#define ENVCFG_UKTE			(_AC(1, UL) << 8)
 #define ENVCFG_CBZE			(_AC(1, UL) << 7)
 #define ENVCFG_CBCFE			(_AC(1, UL) << 6)
 #define ENVCFG_CBIE_SHIFT		4
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 869da082252a460559c9beea3829cc90860d6e9a..811c34d64df88dff116abb52e05054715a474dc5 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -100,6 +100,7 @@
 #define RISCV_ISA_EXT_ZICCRSE		91
 #define RISCV_ISA_EXT_SVADE		92
 #define RISCV_ISA_EXT_SVADU		93
+#define RISCV_ISA_EXT_SVUKTE		94
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index c0916ed318c20e2e2f6354a3a4be1f4437f7f564..932774350de42ec9b66fd7d00efb478ad55856f4 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -402,6 +402,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
 	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
 	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
+	__RISCV_ISA_EXT_SUPERSET(svukte, RISCV_ISA_EXT_SVUKTE, riscv_xlinuxenvcfg_exts),
 	__RISCV_ISA_EXT_DATA(svvptc, RISCV_ISA_EXT_SVVPTC),
 };
 
@@ -944,6 +945,10 @@ void __init riscv_user_isa_enable(void)
 		current->thread.envcfg |= ENVCFG_CBZE;
 	else if (any_cpu_has_zicboz)
 		pr_warn("Zicboz disabled as it is unavailable on some harts\n");
+
+	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SVUKTE))
+		current->thread.envcfg |= ENVCFG_UKTE;
+
 }
 
 #ifdef CONFIG_RISCV_ALTERNATIVE

-- 
2.43.2


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
