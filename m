Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64EAEE7717D
	for <kvm-riscv@archiver.kernel.org>; Fri, 13 Dec 2024 11:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JsklsuyusFdxeYyX/LN9jfYWYWLJG3ygrlAM4HlUk1s=; b=A6JpyFoZrC7Eku
	Wc/UVI7y9+ySW/vco/edV/DTtVjF/RVgoI6FneNfGzfpo9m8wP7+H6Fk5sTG6DBumt0Wu73hgN3rm
	pgB/QX5NqpoRI0uwOtgDbtWi1jXTM3muFxQwQbw9DNcuIFnCrr32CUCwngE6vGDUMIfc7ZtCEOJUF
	08xTuAKp8juXMZrruuWFln/uLz2+jX99hgNqzLu/W+EEZXju9E7vuLxprkOoPW8q6n52cvBtlVQiT
	yT9FC35kr/oR/E34KsGcoCfFRrmyleyfx65FhkJzpuq6Xa5SAY6eQJIyNcyX1/SFPZq0vHfge5BbU
	m2A2/ByFLOhw0cyr4AJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM3vE-00000003a37-3zxD;
	Fri, 13 Dec 2024 11:33:29 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM3vC-00000003a0B-0Qqw
	for kvm-riscv@lists.infradead.org;
	Fri, 13 Dec 2024 11:33:27 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-21636268e43so21062045ad.2
        for <kvm-riscv@lists.infradead.org>; Fri, 13 Dec 2024 03:33:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1734089605; x=1734694405; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NEtptHTU3kr3P35YLmk81GIPaJu3IDUx/dDsQSqkBrs=;
        b=eidWK8VoBoLbzshPw1O1N/e/bpOhMXoBkvNm/WIEGXXUOkQYU3dJBhrtWGLMT2HBmS
         tCKT61iYZwRvr5tLHxuKjFgr2id+d/4E+/PVyOQokTDiASMDR71SscG44iY7VE9Iik+W
         GwbMUhEUtkMY2x3DWFEk7tMwOOhKh9vCr+XAvH6IbDg+sxd0xbU5i3OfTZ8WqD6zPZxq
         Y0ifMZcuYaez+H+jusA3haxwLNa/t8mzMhh6xkg2JhqSWpYYwwX5sn4Xn5KI4Hx/CBdM
         glksl/Nu+cd4YhxQX2DPgod9W0k9kUxVAkzNHyKYIUYbfOFvAdxzjAyTb8gja7f57eXK
         AsFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734089605; x=1734694405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NEtptHTU3kr3P35YLmk81GIPaJu3IDUx/dDsQSqkBrs=;
        b=lI0pm3ji3RqUFPBnMUZFf4+9+IZubUOjEfyhBPn7XH7dcxZxSD4QRiIRlT/geuJvxv
         9DuIBz7jhZe3xmCYX7er+sQ3tppHwa+o/07xGqaX7xRtAex+Ahk1uzFq9oun632dhsxX
         cAocBzLpwL4mz1/EUYFeDQryHSKnQ47EVTIF2RIckjO6Wy02yepGRZHotTaJxaXXzU7s
         m4QDHW2R5PuO1+JJ1iiE1cmxDOYGfAqOSWuzvmwiT/Ky6wOre20fycu4A/IEIl2tNcic
         6ZHbS/VT7I3gurZd6oUVuGhNGCm+Nu/NNI4IdcKvJqJlBl80uwu0EBIf5577nDcr/x2V
         rdAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbDqnBw6EESc6qNwgP5vU5gzd/hzg8DDMmQsShdTdYZsnwc2cvHEQXpDpg/KFxkoBeH8ulFkww3r8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwR7bPextipfVpm94DCZ/GSRvRtwWyCpXjMBq/zff7jHU/3vfEQ
	Yo/cMCAVqURmygEYH0aRmAvm+CVi1/pb0sZiMhNk3Z0+d/AXavuCsZprQiX2JZo=
X-Gm-Gg: ASbGncuHspQ+XKOfMaDHCzCSCs/0zL09sCfnrUdB95c0YRhahwcJCY84p+SKmdxwfcn
	SMZmnEEqFJgZGyLQM4Btz+wAB8Lrvl8ceMWt+ZhhLgUV05t6famL+EA/UnLtbuk/gFKt/5CGJQi
	3/D6HlofUaqIu9PsI5BBOAaWrXwFzDV9UEePzZRvLvmIVxzO4/cQozt9SmiZTbeVMhBesd7/GWG
	pHINJgRbbYLvHC9UXop6WofPo9l7wCD25npoNp6IOnzhfFpYT5NRpQ=
X-Google-Smtp-Source: AGHT+IGqLFD7+ohjLCw5KHfPU8C+4COV+XiGB8UR/WxQfVhsIQvvpPgvT8BLHFS9OjcnFJAe1uWA+w==
X-Received: by 2002:a17:903:191:b0:212:55c0:7e80 with SMTP id d9443c01a7336-218929b9b15mr27260825ad.20.1734089605533;
        Fri, 13 Dec 2024 03:33:25 -0800 (PST)
Received: from [127.0.1.1] ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21631bd2c2dsm103327125ad.263.2024.12.13.03.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Dec 2024 03:33:25 -0800 (PST)
From: Max Hsu <max.hsu@sifive.com>
Date: Fri, 13 Dec 2024 19:33:09 +0800
Subject: [PATCH RFC v4 3/3] riscv: KVM: Add Svukte extension support for
 Guest/VM
MIME-Version: 1.0
Message-Id: <20241213-dev-maxh-svukte-v4-v4-3-92762c67f743@sifive.com>
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
 Samuel Holland <samuel.holland@sifive.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1889; i=max.hsu@sifive.com;
 h=from:subject:message-id; bh=dkJiuVnAYPALmPp61+7Ff1id1Mwaw6rbYo70OgRM4jg=;
 b=owEB7QES/pANAwAKAdID/Z0HeUC9AcsmYgBnXBt3hKCUiKWCXnJ+7Ph45oRx31ZpZbzWBP7Ga
 j9uhhsDjAiJAbMEAAEKAB0WIQTqXmcbOhS2KZE9X2jSA/2dB3lAvQUCZ1wbdwAKCRDSA/2dB3lA
 vewBDACLJG8wmLy2oyopVjS0Gh86DuPlouo7WZyKUbQtzArWQ+Ar+yE2dNY2VOstAKk6TnsyA9e
 V9qsd8G9KerwiJMf1Zfq1DM6cw/JsErLXMQ5aFnKT0UcbnFK6g2vx0VsF4yRF5T7xhXHJfOZ7Yh
 gMIRyvjrb7G+98hgjec4LDP4snG4/wDt+DDc2hXR096zGtsmpNUSBTC3GWz2YZGUyVs4buSoHaI
 OQ6dViZ4g/If+kSyd9w+i8ivWppTY8O3Chuermdf1DUAj7cBLDHnRiDTxWY7odfEt3F/FuTavRU
 VDp1vrJt4MJErbMJ5Z0v+cbh0Rw7Dv+QxGR5ozvJTxs4g6eRQl3T8CPRkW5e7mezG4Jly5XE5bQ
 FPiATWmhpzvKkqJWIaPUKMyIDsik7dapDN5adPUKa8HPpCwJtVS7Au09SAGzfPIiUiph74LCF/L
 Py+0lp5CJ9El/UnUBZBQZLr5wR3ZJSNsF9uVdYEuWeTuD9hT8dDXWcpsD9SdQB3UFYIWw=
X-Developer-Key: i=max.hsu@sifive.com; a=openpgp;
 fpr=EA5E671B3A14B629913D5F68D203FD9D077940BD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_033326_150642_4D728228 
X-CRM114-Status: UNSURE (   8.93  )
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

Add KVM_RISCV_ISA_EXT_SVUKTE for VMM to detect the enablement
for the Svukte extension on Guest/VM.

Since the Guest OS may utilize the Svukte extension simply by setting
the senvcfg.UKTE without any trap to host. In the view of VMM, the
Svukte extension should be always presented. Therefore adding an
extra entry kvm_riscv_vcpu_isa_disable_allowed().

Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Max Hsu <max.hsu@sifive.com>
---
 arch/riscv/include/uapi/asm/kvm.h | 1 +
 arch/riscv/kvm/vcpu_onereg.c      | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index 3482c9a73d1b644385182436192914f34b50b997..57b3abfbbabd967721f140b65f58f002e770eb6a 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -179,6 +179,7 @@ enum KVM_RISCV_ISA_EXT_ID {
 	KVM_RISCV_ISA_EXT_SSNPM,
 	KVM_RISCV_ISA_EXT_SVADE,
 	KVM_RISCV_ISA_EXT_SVADU,
+	KVM_RISCV_ISA_EXT_SVUKTE,
 	KVM_RISCV_ISA_EXT_MAX,
 };
 
diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
index 753f66c8b70a72e76210075b4e07849741f614d4..50fbbe5bade6af83977bac6d381688fea80e7945 100644
--- a/arch/riscv/kvm/vcpu_onereg.c
+++ b/arch/riscv/kvm/vcpu_onereg.c
@@ -46,6 +46,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
 	KVM_ISA_EXT_ARR(SVINVAL),
 	KVM_ISA_EXT_ARR(SVNAPOT),
 	KVM_ISA_EXT_ARR(SVPBMT),
+	KVM_ISA_EXT_ARR(SVUKTE),
 	KVM_ISA_EXT_ARR(ZACAS),
 	KVM_ISA_EXT_ARR(ZAWRS),
 	KVM_ISA_EXT_ARR(ZBA),
@@ -145,6 +146,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
 	case KVM_RISCV_ISA_EXT_SSTC:
 	case KVM_RISCV_ISA_EXT_SVINVAL:
 	case KVM_RISCV_ISA_EXT_SVNAPOT:
+	case KVM_RISCV_ISA_EXT_SVUKTE:
 	case KVM_RISCV_ISA_EXT_ZACAS:
 	case KVM_RISCV_ISA_EXT_ZAWRS:
 	case KVM_RISCV_ISA_EXT_ZBA:

-- 
2.43.2


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
