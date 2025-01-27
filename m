Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72645C02188
	for <kvm-riscv@archiver.kernel.org>; Mon, 27 Jan 2025 13:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=24ITRXuhSZXXMmEeUnpAkN8FGoA7FV7wt3xiVytstlw=; b=C1e8QAeiIU0h90
	ayhT5QO/5gFqaXdJApXfuVahhUazno1KMRUN8SVDGby+HI5lYIj80ma35Mb2skn2VtMCbk2JC2kb1
	fPbRfnBN90ETPzrSdyE+uxOi43EUSBHTF3OWhaQz5w/xkCFiwP6Zmi13eAMaEkAjGerwjx2XTTquj
	tj8xobn4y16Q5hth675c5Ir+WUjUr7YWq8dxTh9v5vmth0bMsUVpisZz38B+s/Pj4FmkSKiVE9yEb
	8iis49fNHI94UDrM9ZUbSdRY6w0mOQDlq1tB3mI44oLvwldBOQ9E6QUbzjUvrcVmMGVAW4g9MNvwN
	dUQApCRl8Jr/B34N62yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcP6m-00000002MUR-0wKG;
	Mon, 27 Jan 2025 13:24:56 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcP6j-00000002MTW-1V5Q
	for kvm-riscv@lists.infradead.org;
	Mon, 27 Jan 2025 13:24:54 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2163dc5155fso75909875ad.0
        for <kvm-riscv@lists.infradead.org>; Mon, 27 Jan 2025 05:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1737984293; x=1738589093; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q1fLkxDezVY5xdUOqyUkkMgsyMNSvYqCY7qCMYLwy7k=;
        b=XClEW33p30zJkhK7jaTpQHLAZAsDv1kv73igQgLg3I0tZL/i3mrZbU+HTs+56Hnx4P
         sZFi8fXEVxVTRYww9RQaRIoPQRGdIz61Sl0wcy8DrB1VErY0cnlhXA0PSS+Ky4Zt73nj
         DbwO6zIvTI/tYHOjkKP0z6KLJjVgnq0B1t0VfztebwjstqALNHJl1cn7UPnO702DDBCm
         04bBb57H/qQf8YzEQuYY5K545/4W1E+oA9CG8Getu+pZsHayovR7GVhglWYmwCaTTq0e
         g9lebo71xrVgRwnAmXWSBmsEIV1Ab7aF+kTiUbeGBx+Xnn1iCrheYybcPy8azeBRSJ3I
         pVQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737984293; x=1738589093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q1fLkxDezVY5xdUOqyUkkMgsyMNSvYqCY7qCMYLwy7k=;
        b=X2cLuI3oLZbhCrpowi/PxCOOEoQWzKkeV3JcLO+sI+M5jGvXIIKNQ5WosBfcpvf1/P
         VqEXJTlvEBA1GFtyFUsJOVDeHdgAZgEBc/cb97xGg8rs2Opap358l2jp0jXowvAAhFLf
         JwfS41ch/q9zizberUJjGtJk+wUCR08a3xEo4slEQMvf8QnDbLDNB373Qz5luzH4JKgy
         AQmZbEL2FB06PJqHldAgta+IRnu00gqU+yL++rRAkhJT06RvuTZCfjmMlAFDBSDP8FYd
         yZXHP6iCRDydJQqXYCZ+n+Y463XNCBp4Qp2Y0pbayjVHScYVgidbohdsM7BPUXevM2sd
         4m1g==
X-Forwarded-Encrypted: i=1; AJvYcCXgsigpUqFQrnzrT9rMsQo3E2UCKImWhIOBAygJIoDgSuK6GyTgkwBbKl9JVqJfvhg4TIo9YDrvEvY=@lists.infradead.org
X-Gm-Message-State: AOJu0YygAOeYDk5QAwL9DdLr6cu6S+u9+oxiwa/oTVpw0S+znMs4Pe1k
	h8XHyd0ttWAC6ceWwrQmfrLmzcX84QLd9C+i7H1ugdsgszZJDweOdERQn2Lcgy0=
X-Gm-Gg: ASbGncvzdGtPs8wYCWNgIY3U00XnUONkUZ23Fp0EOxfNLtTVJlnHU2B5IPIWMG4nS6h
	z7haAcg34hcb0M5S6cdt4J4Dnr1tYo8VsCjO8kn0j98JW6GzhddH5UqQwJ4+0LGfSXbrxI32LlL
	E9pFb+YKmQEWiB5w3r+EZKD/8IguamJbhkKbSlSLJxH5GKaZ7RK8GwRCUJOz/igbB90lhh6+6zl
	rOMto495srcQg3egzcNB3OoIy15ByNzBXHrmI/nMJOlS7Fqx4ksdd36X60plBu0Xq3BXggvYykz
	+9E5cKNdcdx/M+3r2Gti/XwPBm6Cn8TQrx+IsTt0EvxZ
X-Google-Smtp-Source: AGHT+IFq9lwCkTGawArxaN/anWckzzjn/Vj830cQ+kHh71q7m4ZYVMswYhB9yws2yOvIj3mzEr0yyw==
X-Received: by 2002:a05:6a21:7882:b0:1ea:ddd1:2fda with SMTP id adf61e73a8af0-1eb215683b7mr61710813637.26.1737984292764;
        Mon, 27 Jan 2025 05:24:52 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72f8a6b324bsm7268930b3a.62.2025.01.27.05.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 05:24:52 -0800 (PST)
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
Subject: [kvmtool PATCH 3/6] riscv: Add Svade extension support
Date: Mon, 27 Jan 2025 18:54:21 +0530
Message-ID: <20250127132424.339957-4-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250127132424.339957-1-apatel@ventanamicro.com>
References: <20250127132424.339957-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_052453_395509_FD141314 
X-CRM114-Status: UNSURE (   9.21  )
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

When the Svade extension is available expose it to the guest
via device tree so that guest can use it.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 riscv/fdt.c                         | 1 +
 riscv/include/kvm/kvm-config-arch.h | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/riscv/fdt.c b/riscv/fdt.c
index 85c8f95..cf0c036 100644
--- a/riscv/fdt.c
+++ b/riscv/fdt.c
@@ -20,6 +20,7 @@ struct isa_ext_info isa_info_arr[] = {
 	{"ssaia", KVM_RISCV_ISA_EXT_SSAIA},
 	{"sscofpmf", KVM_RISCV_ISA_EXT_SSCOFPMF},
 	{"sstc", KVM_RISCV_ISA_EXT_SSTC},
+	{"svade", KVM_RISCV_ISA_EXT_SVADE},
 	{"svinval", KVM_RISCV_ISA_EXT_SVINVAL},
 	{"svnapot", KVM_RISCV_ISA_EXT_SVNAPOT},
 	{"svpbmt", KVM_RISCV_ISA_EXT_SVPBMT},
diff --git a/riscv/include/kvm/kvm-config-arch.h b/riscv/include/kvm/kvm-config-arch.h
index 7a9ca60..5389dff 100644
--- a/riscv/include/kvm/kvm-config-arch.h
+++ b/riscv/include/kvm/kvm-config-arch.h
@@ -37,6 +37,9 @@ struct kvm_config_arch {
 	OPT_BOOLEAN('\0', "disable-sstc",				\
 		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_SSTC],	\
 		    "Disable Sstc Extension"),				\
+	OPT_BOOLEAN('\0', "disable-svade",				\
+		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_SVADE],	\
+		    "Disable Svade Extension"),				\
 	OPT_BOOLEAN('\0', "disable-svinval",				\
 		    &(cfg)->ext_disabled[KVM_RISCV_ISA_EXT_SVINVAL],	\
 		    "Disable Svinval Extension"),			\
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
