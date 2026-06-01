Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94903CD5BD1
	for <kvm-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 08:44:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5RkOshARTYsCyLFH5paUuSyC442KT7FA4RcKDDxwIdI=; b=X/I3zEH54qEOAH
	2yIDhZQx6sfNu2oIu+j79M51ClIwVYGlRVrIN6/AMcQBIB3Ko3iFqguqHCUi855XK1noXZII8Td2Y
	csAmOdNH617rk8AobHsU+nvVtZsn8bHmeo2VkJvvyaz3V3jVPa/gxXfzNBLOU4cUkWgEUqcSLCVpp
	ZfNk/uTFRoRoyRzSz+kB1hV/CoNqcdeN5GgjovVEO0JLvpRMpxiS4BklIbmXrORknnWL2YeLVdedH
	lzZPO3J1m33zrohnEasTqJM/RfrzPpAYp0qbo4ndAMFoXhb7BDNjZFd3VZ6uswpPpEGiRLZak2cXT
	cJtD36+ttcOkJnrIsmLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyFx-0000000AOY0-1FOj;
	Mon, 01 Jun 2026 08:44:21 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTyFu-0000000AOTm-48OT
	for kvm-riscv@lists.infradead.org;
	Mon, 01 Jun 2026 08:44:20 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-36b900f350fso3365444a91.0
        for <kvm-riscv@lists.infradead.org>; Mon, 01 Jun 2026 01:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780303458; x=1780908258; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fS2CUg/Sh/44DwNmonmJi8mUsAkNkldRmQVB8GPLmro=;
        b=HKYSHFsRZnK7nj2YyWdnWFRtx3OXzwjg5bKaBJp2XIfkemDSV5JAYpHP8qDkum9Hzf
         N4mbEKSyzmPwd9PTW4KSzkdwGdDc2n+nf5jt8IPRm2JwAoQQfNOFy4hhTx6Q2oYzgu0r
         ImoNQPSGw/Cf+knRyJka+EawxIzTp0JyXUGITuw3DscdOxSDAOHqEA8PrH0Mt0trdYc/
         EPAsYRYsmK1xUdMI1k8Sd1qPdHBaS2H9i4h/6kLH9BaiXHGJLD27k0bPH+odOytLymCG
         wJqy1u8A4fMzLyx0/iagGEHpv6GWueWncstjCDUcoC6tT5WcITi7J5tmKyihwWRge9Ef
         Zufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780303458; x=1780908258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fS2CUg/Sh/44DwNmonmJi8mUsAkNkldRmQVB8GPLmro=;
        b=A0yzy3hMyKBXgQSCIkIUO/M9qqtZ43MPTY4qOSa6CenkrtX8kqcgQNVKCXRsN80nPg
         vE3sObrKOPVrX6obpNhXMesnIzLpnKI8UAuS/ZnIn7Bb4m1FZfSkJNUHv8R7VY2uL/Bn
         eZU/YMtqZtZCDe4lIgcp7/zaHjkkpg0wEBA5+JrjbKREwDYsSDUvETv5QIaDRH9VJbY2
         I6gUThJC86r6YLOnmY2PNReyaP8Jr8F+SvY/dbyI/QYMqtgMkGwHxDEAmi5eNB2opZIu
         EYjMx7xs7JEkPC9pldWw29md1QN3X9K+VwJEuh9L8ybFcIcGi2Q9aN5VXFT2P4E7PWYs
         iuRA==
X-Forwarded-Encrypted: i=1; AFNElJ+eqpeb1ICEN1MUQjBMTYkaXW7TrK4ol9Vipl+V7kMC2sVlXJz0nPUlAvIqpYqTyJ91gJR+PiGoEaQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YyCU3+/3LGMvg48fvMhHWSzjKTJrazmD1Bxrt5E0HPuEeM/oXW9
	NQNIYSfX0sXaUGw3EeVLT+/5khtQifgYbMaAYbtCYucNs2mMMyIiP1zz
X-Gm-Gg: Acq92OEqE7jD29NIIAhVHW28ewH18vDtZ6Zwxy0Vv0J+bZrXGYx3vhX7JnrCvQNesg5
	lgcDjf43cLuj/8mbPXOTkuBCqFTbWlz/8kLQl0bNc66aIZxj/beyo8a5V/e0iS96p3iC3ap8OW5
	IW+SP3LJ0zq1gBqyfDxbOpZ65UcrPLW9V57mLIaEZu41oDH7/RQRdqWfw/k3NnnpRnxF07UErlk
	O8fupXhczvaRlu8vOx9s/z+qSvL/EtR8t/n+NuUpE9aNjW4gPrERTNsdLX8UZW9LQQ3utp2oTen
	rwH7k7NHAlt3Bmzfm19ONj9AsjA3VDEXy1ZP3LoaPPKoy/K/b+CNYkUbu+5B/sz7wmZ1IiSXCFl
	aGSSTW8OJgzWA8DTzBiB6gsQLfIaq5bG1ZusEp2BXTxgcmXpK9JSQw0RWQCfgPuUCbSHcCY8wUB
	wkvDc6XVfn7tdJYlNaRwpZcX3qgSaw9T0+AA==
X-Received: by 2002:a17:902:f70d:b0:2bf:379b:53d2 with SMTP id d9443c01a7336-2bf379b561cmr100522325ad.15.1780303458099;
        Mon, 01 Jun 2026 01:44:18 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bf23c3eb31sm92807725ad.75.2026.06.01.01.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 01:44:17 -0700 (PDT)
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
Subject: [PATCH v2 7/7] KVM: riscv: selftests: add Zicfiss/Zicfilp extension to get-reg-list test
Date: Mon,  1 Jun 2026 16:43:35 +0800
Message-ID: <20260601084336.2601675-8-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260601084336.2601675-1-inochiama@gmail.com>
References: <20260601084336.2601675-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_014419_044030_5E7D2310 
X-CRM114-Status: UNSURE (   8.86  )
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

The KVM RISC-V allows Zicfiss/Zicfilp extensions for Guest/VM so
add these extensions to get-reg-list test.

Assisted-by: YuanSheng:claude-4.7-opus
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 tools/testing/selftests/kvm/riscv/get-reg-list.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
index d88edef77ccf..4fab3d2d0b43 100644
--- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
+++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
@@ -89,6 +89,8 @@ bool filter_reg(__u64 reg)
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOP:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOZ:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICCRSE:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICFILP:
+	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICFISS:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICNTR:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICOND:
 	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICSR:
@@ -552,6 +554,8 @@ static const char *isa_ext_single_id_to_str(__u64 reg_off)
 		KVM_ISA_EXT_ARR(ZICBOP),
 		KVM_ISA_EXT_ARR(ZICBOZ),
 		KVM_ISA_EXT_ARR(ZICCRSE),
+		KVM_ISA_EXT_ARR(ZICFILP),
+		KVM_ISA_EXT_ARR(ZICFISS),
 		KVM_ISA_EXT_ARR(ZICNTR),
 		KVM_ISA_EXT_ARR(ZICOND),
 		KVM_ISA_EXT_ARR(ZICSR),
@@ -715,6 +719,12 @@ static const char *sbi_fwft_id_to_str(__u64 reg_off)
 	case 6: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.enable)";
 	case 7: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.flags)";
 	case 8: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.value)";
+	case 9: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(landing_pad.enable)";
+	case 10: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(landing_pad.flags)";
+	case 11: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(landing_pad.value)";
+	case 12: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(shadow_stack.enable)";
+	case 13: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(shadow_stack.flags)";
+	case 14: return "KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(shadow_stack.value)";
 	}
 	return strdup_printf("KVM_REG_RISCV_SBI_FWFT | %lld /* UNKNOWN */", reg_off);
 }
@@ -911,6 +921,12 @@ static __u64 sbi_fwft_regs[] = {
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.enable),
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.flags),
 	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(pte_ad_hw_updating.value),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(landing_pad.enable),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(landing_pad.flags),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(landing_pad.value),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(shadow_stack.enable),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(shadow_stack.flags),
+	KVM_REG_RISCV | KVM_REG_SIZE_ULONG | KVM_REG_RISCV_SBI_STATE | KVM_REG_RISCV_SBI_FWFT | KVM_REG_RISCV_SBI_FWFT_REG(shadow_stack.value),
 };
 
 static __u64 zicbom_regs[] = {
-- 
2.54.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
