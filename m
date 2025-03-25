Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEAD1C3600B
	for <kvm-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 00:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nU75ZTuEEcp/bcOoUIZmPD5/7OrXsO1YOsCnrFIsKS0=; b=OuSJ2fJJyLMClJ
	zGlDWBZgs/eBv8TbBJPXAkjnydm6CdFSvYsLV4KwpZSvD0Vl5K3wbDFbz4fwUpPiaCTqUcWeJ0LZL
	1xwzPjQX6QsI1Pgamzf6gYgsqjwbbGlNv/R1E0OvRlvlnlKA4dk27wKisoRkOP6GHS0+4I82w37ww
	B24HSB4LRw6sGujkQ+md38O/qlzte4E8+IuhFkva4jvjtSdVbgkkWJ3W4JUh4XVgaZ7G4L3pR5ucI
	WjPpQCflnFluRaZGKAu45gwfx48tZxjZrzwDK9t0kH6eU27l6+yQCIaKo3FBYUf8LJCt1duEAR82s
	2BTnqdS8xi2zDymr/DPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twsLX-00000004Y65-2OGm;
	Tue, 25 Mar 2025 00:40:47 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twsLU-00000004Y3p-2F6c
	for kvm-riscv@lists.infradead.org;
	Tue, 25 Mar 2025 00:40:46 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-22548a28d0cso99861275ad.3
        for <kvm-riscv@lists.infradead.org>; Mon, 24 Mar 2025 17:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742863244; x=1743468044; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hkzfSG0KriYdqKt2ggB4CIBVtIx+E6Xmjf6eqJhLj/A=;
        b=cUxhN0Bi6MJRKTYKo2+NQnXxge+vWxY2zXcP5ZDzabDWIT/R+IrDoB+hQN3uQLASL2
         YMBAHuI+jaOrD8clkTEypzRNc13+cuqkV96ZXItghZzWTNCD4nnbP7GEjqStes5TCeJT
         eyDckuKQEMweQOZ8IzrM+xVCZEX2JVzbrQPcN3lo+60STnmYwp9XHxmSHD4atfb5afAJ
         HPNFkaVHJdcEx6QzhWp+Y6XjFxaRi38t0RaMpjp6US/e9U2Q9qb9oXR89GD95P3qDzxT
         X6L168VyPgbY9J7vAa62zZDFXaVrQUtJERy69X64vA6zSXx9Bepd1p3J+sRYyuKHr+il
         ha0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742863244; x=1743468044;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hkzfSG0KriYdqKt2ggB4CIBVtIx+E6Xmjf6eqJhLj/A=;
        b=ETBIMJcDHDVV0e/I4kh9tHijpoMsUie1qbyGf1d2VsUtQP2IsEpWeeS4EqTPMuYTnX
         XMAV4+yrJja5lc2ZpbjPQvdmzes+EHxECpvTK2qpv49UqBqUCbcO5dspiMvJkidqDks1
         AwfVmmWfdOFnNqABdX8jBiWG7VF5dzyIzO2OtNHERHkg9PxvVtTpUsNYKxYkQIe8smdF
         Z0E9minKZdrK8yPxySpRGJ2Tg5O1gmFyMlJFaAi0rqTJQPJXjhZo5q7JfI5ZI6D0zOnq
         hy0XgK/0kSXLW97ROMi0/3QLhmSgTDDW4R1gVkTm6kgYK+8QZidOklmHyAImqpU1D3/l
         HLNA==
X-Forwarded-Encrypted: i=1; AJvYcCVbLD59+ucYYr3MvsKnh03++Zg/dzTPbBwN8mx0EF+6SAcOsz0DfKdtlzxTUGniA7g1UiaeyWiBpuw=@lists.infradead.org
X-Gm-Message-State: AOJu0YzIqupjGke9th46JGoQ0V0AUtGZwvAqq6QJd5Wxg9xwq6Kzs8N+
	FNAtis36CQ3oI4OBJdzcUZgTmUt+UzBKByBFc7QwyHv32Mi7SfFIMn/e624fbKU=
X-Gm-Gg: ASbGncue1Tv6j0gyBS/CtzRyP0GGZB2fCsxXCEFDshXjw+SIoLSKM2o+jLnxhKjymth
	VeS1JCRUdBtcHbVHlvyKsOM3ehpaFu9a0w6Z5vz77XddfHwNyC7rLDuXibnbIvIKk8qOIBNZYXo
	CWm3u5GbNTMN91YnVIV6YzpVr4EOqXYAxrrsMxX9jxqn5D1EupaQIYe1s0I2Jn/fiqlhy1xO5JO
	8UlP+lYTR5jQ3MiNH4oEY42T8wMk6j47fehJfp7SHhlVYhdk33MhBjRaSXe7zDcgH3xVm3qvk4c
	MG7OJrjtYaDpZEx3miQwOYqJU8ucjgqfMz2JwR6h1QX3wwUAds8pe+fs3Q==
X-Google-Smtp-Source: AGHT+IHZo9yFD5wVvlHsZ2Ob2mdY/LteNi32aWoOs7e7aKFg5g40FhjpBRzw6PFwuzSYjgzfZKYYEw==
X-Received: by 2002:a05:6a00:180c:b0:736:5e6f:295b with SMTP id d2e1a72fcca58-739059b301fmr19822371b3a.12.1742863243652;
        Mon, 24 Mar 2025 17:40:43 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390600a501sm8705513b3a.79.2025.03.24.17.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 17:40:43 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 24 Mar 2025 17:40:29 -0700
Subject: [PATCH 1/3] KVM: riscv: selftests: Add stval to exception handling
MIME-Version: 1.0
Message-Id: <20250324-kvm_selftest_improve-v1-1-583620219d4f@rivosinc.com>
References: <20250324-kvm_selftest_improve-v1-0-583620219d4f@rivosinc.com>
In-Reply-To: <20250324-kvm_selftest_improve-v1-0-583620219d4f@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_174044_578775_6B8E8D21 
X-CRM114-Status: UNSURE (   7.88  )
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

Save stval during exception handling so that it can be decoded to
figure out the details of exception type.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 tools/testing/selftests/kvm/include/riscv/processor.h | 1 +
 tools/testing/selftests/kvm/lib/riscv/handlers.S      | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
index 5f389166338c..f4a7d64fbe9a 100644
--- a/tools/testing/selftests/kvm/include/riscv/processor.h
+++ b/tools/testing/selftests/kvm/include/riscv/processor.h
@@ -95,6 +95,7 @@ struct ex_regs {
 	unsigned long epc;
 	unsigned long status;
 	unsigned long cause;
+	unsigned long stval;
 };
 
 #define NR_VECTORS  2
diff --git a/tools/testing/selftests/kvm/lib/riscv/handlers.S b/tools/testing/selftests/kvm/lib/riscv/handlers.S
index aa0abd3f35bb..2884c1e8939b 100644
--- a/tools/testing/selftests/kvm/lib/riscv/handlers.S
+++ b/tools/testing/selftests/kvm/lib/riscv/handlers.S
@@ -45,9 +45,11 @@
 	csrr  s0, CSR_SEPC
 	csrr  s1, CSR_SSTATUS
 	csrr  s2, CSR_SCAUSE
+	csrr  s3, CSR_STVAL
 	sd    s0, 248(sp)
 	sd    s1, 256(sp)
 	sd    s2, 264(sp)
+	sd    s3, 272(sp)
 .endm
 
 .macro restore_context

-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
