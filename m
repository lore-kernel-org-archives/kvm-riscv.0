Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BFC1C369D3
	for <kvm-riscv@archiver.kernel.org>; Thu, 17 Apr 2025 12:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oNmnHlHLkyd1/J6dKxtsiseWVUadTwf883hsJ1w4TvM=; b=Njwe3SM3WzX0dy
	HPF05ZSP7+9Z1Zc6XOsBWssE7DjJtenjBVmzqwHXPwWLXAm/ofbd0v/yfCXVSLPpb/sy59DwxYJcm
	KBT1kdBjsIY2sL5/dukWCq5nqm7GZ5NCLlvJ0EhfLrYrXda0J/D+3b4Xn8LLkvqsVVr7qnd8CMP8F
	9pulWfUSuqo/y8oKdqgIXZfjjlRRujLL+OwSGDbv+D1xRkEvh98Az6DaUI8vAQH69oXInk/EoJxIE
	C+PGUSGIF9Kpa3/7E+nULuRqUUXjyJj0ZDgZqicAd6Tr9X24+qPTbI4K59ur2dad2PW25rSTk/lM3
	5oev3F6PByNEiRm5aqwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5OTV-0000000Cz9f-0zHJ;
	Thu, 17 Apr 2025 12:36:13 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5OIf-0000000CvhF-2jxi
	for kvm-riscv@lists.infradead.org;
	Thu, 17 Apr 2025 12:25:02 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2295d78b45cso10719665ad.0
        for <kvm-riscv@lists.infradead.org>; Thu, 17 Apr 2025 05:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744892701; x=1745497501; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nIScjDpjhLjkf06YMmBlHqg/pe/+cSuNoY3aF822M2E=;
        b=e3IUqv1NA+u8d3mSgCs5I9e0TNsDjDuTPkWzWYpZdJSZRJTRcBbwQ6R+SWW8odXac/
         eIvTaFNa4+csekPDvxDUaN0rJthdy2NXVbg9Qjiiy2Hm235ZwVOG222/T0hY6KgpJHXB
         msz4Uc6M6fqaTXo0Ulc6xUPMJiHB9HioQj94X2o6e+2UqT5i3D3dhGcfYzvTuQ2SIOBo
         i39YGUK3Nyx7fnVjjgtgtdd4gl69TevXmzZks3TFuGaGM+pFYlSZ09iX9VCOKXVXmPyy
         Uw9WgqHvZL5uKLXFo+fu43pYRZb2Mmzkpw19DyBEdhn05CiL47W0jjd7wnGy8Y+zyfPe
         NwpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744892701; x=1745497501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nIScjDpjhLjkf06YMmBlHqg/pe/+cSuNoY3aF822M2E=;
        b=ICKggiiiKyMDos/LjVZt/M9Lrcg6VSgiFijHzZVoT0OxvHL6z6GhWI3zfLKMsyq+mn
         iWE7EV/HInFTyeDGNSarcTPyAQ2IM0JSiTGc/VLfl74mD6VEtLgDFOE767LUBZHmtwzt
         mfQKBSEarO/Z+w3LdkuReBaBqKHbnsOOcFrUpuOcsoGuYm4e46e7O1whfSL7x43IE8Bp
         Kyg5MoRhxD49LhaP7+6bK1lU4M4eSoWQzydkx7ncD+tnJFdGKR5LXEaHQwFhIiUlgLlY
         zPCyRW/QPj+JCFvZO4oW5CkY/Vfw7igJlICCTZzVSYC6m+2JNf+5f7XQ20ZVA7ENikl0
         LPvg==
X-Forwarded-Encrypted: i=1; AJvYcCU9fYGPd6YN+wSUmZx4YyJaaF6W1LR0ShOF50ubcLZVvwG1dKmOVZ3Ims8eBjT2WvQWbdz89tOq118=@lists.infradead.org
X-Gm-Message-State: AOJu0YwKt8cz5wsMdr0aCvo9upROfmRMS4TB/2wC9mRO2dkgw+Eydajr
	wH589W2tcTUY+LAtmmFCjFVAAUT2sdDBEk4Nz/U5h6e6/GjE/HWgYoJ1Cx83CQI=
X-Gm-Gg: ASbGncs2vV0X1lsMrvf0gVZXl0B5vsnGqK5WDFqMDHzexP4rkCyS9yK3D3BApo9SYYC
	mccyQ5vefDOG0nEMNRiHcOa0lVRpQxNuzKurE8lFjOeGthwOH5CWXXzSUh1PGA1Cs983DhtkkCz
	RElApXizxO7AUEaqk8GmsVeDpLmL88elgSjiror8DJvHsRj99YzlFddQYGRGk9tFaLCQcXTDUw0
	OymIF5RFIYouocs3jXIwcix0WnUX0v5yM8IMnZuTN9ZCI2bchz0oFi+BWh/GiZET5SY9cCc/DIE
	LQfmot9gamKkCBRF9Bj5xBO90tygdKTyjVUJ8qDUAQ==
X-Google-Smtp-Source: AGHT+IF+QdSHgucK282rG6JIZxJMqqmRWlCOO1zcFo/iz9JeHV9jdYKxWAUM/FMJsou8iVRkgl5odw==
X-Received: by 2002:a17:902:d48b:b0:22c:36d1:7a49 with SMTP id d9443c01a7336-22c36d17c11mr92045175ad.53.1744892701180;
        Thu, 17 Apr 2025 05:25:01 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c3ee1a78dsm18489415ad.253.2025.04.17.05.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 05:25:00 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v5 07/13] riscv: misaligned: use correct CONFIG_ ifdef for misaligned_access_speed
Date: Thu, 17 Apr 2025 14:19:54 +0200
Message-ID: <20250417122337.547969-8-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250417122337.547969-1-cleger@rivosinc.com>
References: <20250417122337.547969-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250417_052501_695671_0F4C0189 
X-CRM114-Status: UNSURE (   9.74  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

bWlzYWxpZ25lZF9hY2Nlc3Nfc3BlZWQgaXMgZGVmaW5lZCB1bmRlciBDT05GSUdfUklTQ1ZfU0NB
TEFSX01JU0FMSUdORUQKYnV0IHdhcyB1c2VkIHVuZGVyIENPTkZJR19SSVNDVl9QUk9CRV9VTkFM
SUdORURfQUNDRVNTLiBGaXggdGhhdCBieQp1c2luZyB0aGUgY29ycmVjdCBjb25maWcgb3B0aW9u
LgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgpS
ZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4KLS0tCiBh
cmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMgfCAyICstCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNh
bGlnbmVkLmMKaW5kZXggZmJhYzBjZjFmZDMwLi5jOTlkM2MwNWYzNTYgMTAwNjQ0Ci0tLSBhL2Fy
Y2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5l
bC90cmFwc19taXNhbGlnbmVkLmMKQEAgLTM2Miw3ICszNjIsNyBAQCBzdGF0aWMgaW50IGhhbmRs
ZV9zY2FsYXJfbWlzYWxpZ25lZF9sb2FkKHN0cnVjdCBwdF9yZWdzICpyZWdzKQogCiAJcGVyZl9z
d19ldmVudChQRVJGX0NPVU5UX1NXX0FMSUdOTUVOVF9GQVVMVFMsIDEsIHJlZ3MsIGFkZHIpOwog
Ci0jaWZkZWYgQ09ORklHX1JJU0NWX1BST0JFX1VOQUxJR05FRF9BQ0NFU1MKKyNpZmRlZiBDT05G
SUdfUklTQ1ZfU0NBTEFSX01JU0FMSUdORUQKIAkqdGhpc19jcHVfcHRyKCZtaXNhbGlnbmVkX2Fj
Y2Vzc19zcGVlZCkgPSBSSVNDVl9IV1BST0JFX01JU0FMSUdORURfU0NBTEFSX0VNVUxBVEVEOwog
I2VuZGlmCiAKLS0gCjIuNDkuMAoKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8va3ZtLXJpc2N2Cg==
