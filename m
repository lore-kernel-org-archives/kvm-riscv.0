Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F36EC0218A
	for <kvm-riscv@archiver.kernel.org>; Mon, 27 Jan 2025 13:25:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4Xz2J4EqAzSa4yttFWrWyPjmjtyCqDmvoXjJHBxPHN8=; b=JBmHCM//lesfK5
	2zXg38AwLCRTNDz+4y0roqyVnRTwQJz+t7HabdrED8LIixKyorrjgTPCJiacm0h2fZd5aVRxm7kLC
	Ba8Ebi9I8vSvKW3jcHpjnj8wcl0ZdAlQ/m12rSac+/nNYlbDmXmYlIKIg4mlsZsV8wGLAe8FR3Dp/
	qLItpB50DVZZqTc++zP2eqJHoms+sz08LdMVLaEoYiQ8DrwH2zFN0w9q/tSq3G5SknQmPQ3bgXotF
	OJ0baUDvcficyAIklVtyJZCAY7aDgR/F2PaUKjqs2yL0gp9B+9gouDSQyIV1KVnLytvgdvzVSZTsU
	VRVFRIuRbKsMuk2N333Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcP6w-00000002Ma5-0LGX;
	Mon, 27 Jan 2025 13:25:06 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcP6t-00000002MYk-3sE0
	for kvm-riscv@lists.infradead.org;
	Mon, 27 Jan 2025 13:25:05 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2ee67e9287fso7590891a91.0
        for <kvm-riscv@lists.infradead.org>; Mon, 27 Jan 2025 05:25:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1737984303; x=1738589103; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ClVUDaF5nKQfJ2TSW+emY+qFs9FRjC0yOn/dakK+/xw=;
        b=ncUHIof4OIq3xkvqZGayJDbDGamt6xGAsybErA2iaVf4UAFsWmRXL4wtVFBZJVU7cI
         UcEiBnV9mCxjAOkHd9T3XYkpCtZopQ4JuRADUsOVUa+xYwFzWr1t4CFPt+QGwjyDH6q0
         oSBZP9IYSzmJ1NtMKQLZwinRqCxmo5arH6lerUBI5lL66GQ9yXJkyBexn1ZdNjXQt4Kd
         zNJkrhH9Iwrkv0Lba073uc5Fri2+TIgHskq9z6WTiznIN7ohSJU2Wrnjxt4+F0vMrT98
         lWCj2prEaWYChofXGqD4pEqYQwG2gG6r/vN2d2fiO1evvai8LXrOobPGA5TgJNkakKpn
         tIow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737984303; x=1738589103;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ClVUDaF5nKQfJ2TSW+emY+qFs9FRjC0yOn/dakK+/xw=;
        b=G1rnHBrQgZosiZVUCAgVeVkh4U/4/GzPeBt0f58KqR9bjCryATMFjdBwi8wcH4zTyz
         waJe0mEIoxn6bdb2aEHsCdOGngXtBTvQ7Y2fUez3LWgj0rxDYjbhKhz0hJgcyBlSJb3V
         BMiqn7i1WICc05f8lOuvh68wIa6sB0+lzURx8H2T5CqUgCQOkP8XBbCxGVVh8d50v++P
         o7eWfjZb9bgxjnToBrdLdYM6/GZZyV2ajiPxEIWUmz3kTL/FFw0FuFGKLdGRfTfzW0yX
         PyJg4PhvmEK7ZFIzeKo+ELGG4QuSY8rZ0litoU8AFAXE2/ZsEoy74XHPHn/vllAZFehn
         T00g==
X-Forwarded-Encrypted: i=1; AJvYcCWc9zuxZQYZQnmxnwldlVWbthDhGM1gU4Q0Db09LZ/R3On84lqJsTZhwCFAK4OdpvMivYOx91XJmHM=@lists.infradead.org
X-Gm-Message-State: AOJu0YyBHdYSVIBuPHI/vPleU7Og4b0tAMEm079OAjtAGmNcZhK039Af
	H4d1pJa2abDhVa4jJZ1oxF7fer9KRXdWN08P7lOFEpqSZHqN9NCmZb823hNtKqk=
X-Gm-Gg: ASbGncsxmDwAUzFy1qlXur96XVt1XWBfLHYr7iJGFxCEXCNrunVXJ7/XKIAJe3wtPfg
	x+oWSt3Xlqy/X3r3aPmyzKpyFg22euFe1T1pVErrwgHNOiJEJ/wkdrs0BWqDfeRy0DGzTL50+CN
	NVDHLo4XNsHPKVrey6Q0wz9NUt0k77/2WZbqu76PV3aQBKo8HkWRmhkVNC7Fgxl0mE6EGKrXaSN
	aIVRChuV191mbrci0d3+VrYcIG/zt4Wy2m9fr0fj9lMtbc0gLweIwgjzXrxkqeOsC4PebJphrhR
	RZHQUchHpniraCS10EnKfl/KnzyjIX5xEx0g50E5ir9k
X-Google-Smtp-Source: AGHT+IGuzEYHNDOM9dPEbUhYWot+R93Z9Vr9Jf7CFXB5tvlmQE7HvRHwQAsT2i4beE2ZMJBCdl2AhA==
X-Received: by 2002:a05:6a00:2448:b0:72a:83ec:b1c9 with SMTP id d2e1a72fcca58-72daf9bd895mr57630242b3a.6.1737984302924;
        Mon, 27 Jan 2025 05:25:02 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a6b324bsm7268930b3a.62.2025.01.27.05.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 05:25:02 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Will Deacon <will@kernel.org>,
	julien.thierry.kdev@gmail.com,
	maz@kernel.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [kvmtool PATCH 5/6] riscv: Add Smnpm extension support
Date: Mon, 27 Jan 2025 18:54:23 +0530
Message-ID: <20250127132424.339957-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250127132424.339957-1-apatel@ventanamicro.com>
References: <20250127132424.339957-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_052503_959990_305236AD 
X-CRM114-Status: GOOD (  10.10  )
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

When the Smnpm extension is available expose it to the guest
via device tree so that guest can use it.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 riscv/fdt.c                         | 1 +
 riscv/include/kvm/kvm-config-arch.h | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/riscv/fdt.c b/riscv/fdt.c
index 7f774f8..4c9dbc1 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -16,6 +16,7 @@ struct isa_ext_info {
 
 struct isa_ext_info isa_info_arr[] = {
 	/* sorted alphabetically */
+	{"smnpm", KVM_RISCV_ISA_EXT_SMNPM},
 	{"smstateen", KVM_RISCV_ISA_EXT_SMSTATEEN},
 	{"ssaia", KVM_RISCV_ISA_EXT_SSAIA},
 	{"sscofpmf", KVM_RISCV_ISA_EXT_SSCOFPMF},
diff --git a/riscv/include/kvm/kvm-config-arch.h b/riscv/include/kvm/kvm-config-arch.h
index e3eeb84..5eccdd0 100644
--- a/riscv/include/kvm/kvm-config-arch.h
+++ b/riscv/include/kvm/kvm-config-arch.h
@@ -25,6 +25,9 @@ struct kvm_config_arch {
 	OPT_U64('\0', "custom-mimpid",					\
 		&(cfg)->custom_mimpid,					\
 		"Show custom mimpid to Guest VCPU"),			\
+	OPT_BOOLEAN('\0', "disable-smnpm",				\
+		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_SMNPM],	\
+		    "Disable Smnpm Extension"),				\
 	OPT_BOOLEAN('\0', "disable-smstateen",				\
 		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_SMSTATEEN],	\
 		    "Disable Smstateen Extension"),			\
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
