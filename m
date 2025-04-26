Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 933F0C369D5
	for <kvm-riscv@archiver.kernel.org>; Sat, 26 Apr 2025 11:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LXbhtHzYMkir09O/f5ZJYkLduwfLZ9W9tQF4PWX4z4Q=; b=UrNy5OAE0///MC
	GZgcKMu8Rn6uE064ypNkxK6NURYzvrdX5+DWeptQEZOO3OIiT738/bB/rLXWOk8n9sdH0rDr9/Nrn
	1pfkOrenB+MFPiCqKBJYEG5u0YcldTj9HOGPaNW8zAjzKpYPcClccW7ShJDcD5abHMcM/3eyDJYmY
	GVTTNe9H+x7rGPjJdTv6oaYCOvR8Lu+fVsbOay/P0PBA3KpsP0/5Q/vTWz5ypU2oi3mGS4t5yG3Kr
	jGfU4J3qy1aEKYVx1XrrzUyHoKOcJ5Nwn+2hAFctFNlWzWF9W0hvhz88xg3Jl/pWM8f90Rh4RgNDM
	OWwFyNhIYZbtyKpJ5ycA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8dKf-00000001u2f-1T0z;
	Sat, 26 Apr 2025 11:04:29 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8dKd-00000001u1S-2l6u
	for kvm-riscv@lists.infradead.org;
	Sat, 26 Apr 2025 11:04:28 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-223fb0f619dso35603495ad.1
        for <kvm-riscv@lists.infradead.org>; Sat, 26 Apr 2025 04:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1745665467; x=1746270267; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qpgStyTcu6ohuguHcXTsVTGNp1bnGO1cAa+NtUp6vks=;
        b=FwNy2mgzeYgXOHYUcPL0N2hlQjopT/JYyPfmBxwnJCGDPBivOSp3GaeRegIZv5ojUk
         HhOSm7Hu3mGEMnKCQffanhG3ICyhlLW+2qDOZXk7WnNI4qN5LzmX+UVxXqTCYo94rwJ0
         zb6qLKRM1UQxfsrvGNkXx/Ng8GnD31yYqUEaX+68MrpDt0bh9aQcD5q+HFbuR4eAtwnY
         exPpt35PFA9aR4aqWMfGGX2lfMhNGHhDM08wtMpLXDMkq7dVY/mm0/8dPnb0OnmidpR0
         r725jM06+cfGlxOLxs+snRprA3+MX3b61uOhTxtXFPluNJ4xTQ6+zPmh3udSzNduex60
         oEOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745665467; x=1746270267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qpgStyTcu6ohuguHcXTsVTGNp1bnGO1cAa+NtUp6vks=;
        b=ZAxEe7DUMxItTg6pbB6FndQWM5Z36anrSw5cjmpH+7X5Sr1IOlwntzJvFIbv1lFjHk
         bTY0eReu6YqpJc9nzAmcCunbCUrV0BHjDxIiJGj7xgD5WAWySKfJ9wEmlwo1hCIrT3pj
         zKhUiy+iwzQde94jWFK3+H540nXfggckBWpwTEfHds8jQsZHGREQzxrLGaYIqbYrXBiv
         AplBKU9LwQXS09YerLfakoLAlXGZBj2kiFq87TkFYlSbNReP7lvanMASx7rYI7APhYDb
         glEMgpMPxEBewVWIGdTc5HOXFQMoyNdLhf1BDGbjWV5e19F3pQnzLJq0gO6BHOD0388F
         84zw==
X-Forwarded-Encrypted: i=1; AJvYcCU3EFciuI1vSAFxjBmQNgidA/QoGiknU1Nm7c4gK5a7l/g8wC7/dZBmTFnyP+cppSFecBOp2nuxmSk=@lists.infradead.org
X-Gm-Message-State: AOJu0YzVMy4HchlYOS1tgPxllzWG2pVaasuxAJhCEbXvK0B7o8wXbv4q
	nICX/yQNlQhxj8kCsywdV0VnOEZj8/kJTlRgoyrHIjVrsHiMRUW5Qh/Y2WrDNNs=
X-Gm-Gg: ASbGncvr/slG+TF9zQpZQBwfVA3QNVEuBEN9zHi9FTQGQ15AokxRHBnLrx3XYrc4+mk
	8P4EiuJCDgvNwUqcMNeblv7S2ua2jy+7Ly7mDurS7VdAlZSljX5WQ9gk/Ly5evS9DJ1a1+owyqS
	dtOyDNaAPKel7Nh7QLMVkN9fyl2Y4U82DtHHsvCSkUeS+aWMHBPoY8vGjYeJn1LzpcG2HY2HEIz
	xKDIO5umV84briwGyN1Jj+rUMhXWlZekT14f1G/MSwX3pr8Y3vWh5n1GeKUDDGl+H24lVvei6/S
	i1hl0DqltsHAClb5iKw1Rn5hRWMUCz8JxtX33Bmjl3Pxy1W7OLl9WOiWHt44y8DQmy6xEx+rY8W
	/3LvK
X-Google-Smtp-Source: AGHT+IHY+MWooXBudXe6/FxvZppRhx+JScomLCpPvE4NndfOyCY9KevTgUJayj3I4wHjFdFKIRZh1w==
X-Received: by 2002:a17:903:1a24:b0:224:76f:9e4a with SMTP id d9443c01a7336-22dbf5ef699mr91723255ad.14.1745665466641;
        Sat, 26 Apr 2025 04:04:26 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22dc8e24231sm10956725ad.125.2025.04.26.04.04.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Apr 2025 04:04:26 -0700 (PDT)
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
Subject: [kvmtool PATCH v3 06/10] riscv: Make system suspend time configurable
Date: Sat, 26 Apr 2025 16:33:43 +0530
Message-ID: <20250426110348.338114-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250426110348.338114-1-apatel@ventanamicro.com>
References: <20250426110348.338114-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_040427_693138_A55A3635 
X-CRM114-Status: GOOD (  10.49  )
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

From: Andrew Jones <ajones@ventanamicro.com>

If the default of 5 seconds for a system suspend test is too long or
too short, then feel free to change it.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 riscv/include/kvm/kvm-config-arch.h | 4 ++++
 riscv/kvm-cpu.c                     | 2 +-
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/riscv/include/kvm/kvm-config-arch.h b/riscv/include/kvm/kvm-config-arch.h
index 0553004..7e54d8a 100644
--- a/riscv/include/kvm/kvm-config-arch.h
+++ b/riscv/include/kvm/kvm-config-arch.h
@@ -5,6 +5,7 @@
 
 struct kvm_config_arch {
 	const char	*dump_dtb_filename;
+	u64		suspend_seconds;
 	u64		custom_mvendorid;
 	u64		custom_marchid;
 	u64		custom_mimpid;
@@ -16,6 +17,9 @@ struct kvm_config_arch {
 	pfx,								\
 	OPT_STRING('\0', "dump-dtb", &(cfg)->dump_dtb_filename,		\
 		   ".dtb file", "Dump generated .dtb to specified file"),\
+	OPT_U64('\0', "suspend-seconds",				\
+		&(cfg)->suspend_seconds,				\
+		"Number of seconds to suspend for system suspend (default is 5)"), \
 	OPT_U64('\0', "custom-mvendorid",				\
 		&(cfg)->custom_mvendorid,				\
 		"Show custom mvendorid to Guest VCPU"),			\
diff --git a/riscv/kvm-cpu.c b/riscv/kvm-cpu.c
index ad68b58..7a86d71 100644
--- a/riscv/kvm-cpu.c
+++ b/riscv/kvm-cpu.c
@@ -228,7 +228,7 @@ static bool kvm_cpu_riscv_sbi(struct kvm_cpu *vcpu)
 				break;
 			}
 
-			sleep(5);
+			sleep(vcpu->kvm->cfg.arch.suspend_seconds ? : 5);
 
 			break;
 		default:
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
