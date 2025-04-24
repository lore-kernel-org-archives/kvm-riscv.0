Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D154C369C2
	for <kvm-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 17:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xza437YJNQOJ/FL+ww+kpJz0HgSTH/okXvUIA/ax8PE=; b=PnIDjBRwhbQCC+
	jcgwyQD2Jb0dLLsfrFRNLzwnky8YnSg0hfT6TvIRtuoGtvOd9k0WFrWchsjuib4/1TXgm7+ENi0hM
	bM3Qet2aclaWAhQll+NEb7rLjxJ6o6Q7DZ6bSSN0mx0+ELS76NIGwXdfa/E7AnN6Iq5jEW+X2ovYn
	BDd2T33OdPRUlQgKaJY7u2HL/M9LQEnMvUlE63+XlHNwmlQp9nSEgGvvxT2wMDhJBjoMRE7FcGc85
	2fxJJKkh283nUfVnUo8w2/Ov1yRceqc5coalZMLGvJLrQ0leSByDQeR3SJrpKTre55crpVlhy+m8Y
	0qhFy4l0uMJV+VesZUDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u80Sd-0000000EuSt-0ZI6;
	Thu, 24 Apr 2025 17:34:07 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u80Sa-0000000EuQg-0s85
	for kvm-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 17:34:05 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-22c33e5013aso17664565ad.0
        for <kvm-riscv@lists.infradead.org>; Thu, 24 Apr 2025 10:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745516043; x=1746120843; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kJ5IZYf4f1NhGHvFycXXpF/34tAS76qwhFgvuPH97UQ=;
        b=yxvYUOnQoyzU4HFfz47h3ByInvJWziyfVWaS3iqergAXW0gcvWtSHaah2eHGeifYpd
         CK0EsUq+FWdTBGvEgDzL6Iwiif1ClXgrQ851K3Qo7a73NuEH00vQNRKSL2LaEgIA1yWr
         bcc+LPvlkcwgwVdUL/y/tVkorwbgRtctd52jPPjQkHHvo6MHca498CnuPwIDikqLQCx2
         NQ8Fa4rxhFn58oe98LV7CUEwq2BggxvbODbx3xos4Qww9aJw6FOxdWxa9Y+KRdYSqS98
         EqgyMfB4znbwSu1BPggVwqXe0KPDXeipcAvqBym7wbudbBWJO1mHkwsvnjWYIqLXgHpp
         QowQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745516043; x=1746120843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kJ5IZYf4f1NhGHvFycXXpF/34tAS76qwhFgvuPH97UQ=;
        b=dHbNneyQvSUpBaru+pXv+byY45u1W13Y6CjoCkG2HoGVikBnpoZh7yJ+MM9LIekmwy
         BMRMTkBCc5l4Ff4MPfaSd7nCedsGfDnLcXtz9KReqKlFiyvU2zaVJb7Mss6tlLDTek7J
         Eo5NX4UDcaf3DI6UlNOrEijFun4/C2zyUcoQ7lbicoEHij+j+qu0Sx0+4nECwEUVE3ik
         wnla8y3htm/7PIFyol2VJUJj4Np/7rd0IkU95hyKSYuFMhPXrIzEBfC8eLXwD7k1BNaR
         wsycwuchziPMI5xcm8xsAM25g7BtikKZ29FaVej/l42Y+c4nXhn/hUpP3GuUNfcGkx3L
         Qd2g==
X-Forwarded-Encrypted: i=1; AJvYcCWSg9KXW9NaI0seMDzvV/kwgTyw4ByRPfjQIN5MiJ7oq8aeNG+KvRtD+yXWk1ykipUeedpK6GyvUL0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwxC6+tkh1zg5QX3KgXOaHyNBJZf3oOnl5wbop+vY0gehOXHhle
	15G6x2T/c3uA2TbyRDgyExAv8SsRAxJ+MCL6Gei7XUy/SRWvrtbU1tTDmEjl4fE=
X-Gm-Gg: ASbGncuK8jZNIjfgax0gZXqORtYTcoKOW0PgfRHgHkB7YXWe7VnSPlqjtQ1ijCJf1JZ
	P/oWaDLDArNPnqKwKK+X03osTUpBDmA2jCA0RSAraMgMmJSHumJxlFz2DhhLEy1VVQ2slCrwIbo
	yS6ludWcexlA7kIOUSI1O0RQQQEeqm1MrZIll5Cm0ZsDWiSX1Cx9My/OUaCYoK2KMqpvrSrfy1j
	yh7vhIVvKOcWkG65TZS0UhmtQ37G3qb2+jFluFNT9srwBbtdeGzIA89A5Q9F4LzqBWI9qCrAoyh
	r4Vcf20CuzwYjhSpBgSY+pS03q5P40Rx6C7RLHZkaQ==
X-Google-Smtp-Source: AGHT+IHzS5PXDP+Qy5Xmwwn0uCCNIK9/92EEG8lEAWpb5PTGOgGH/HAmRDTuUMHUdz3Q/hblJk8Z1w==
X-Received: by 2002:a17:903:234e:b0:223:67ac:8929 with SMTP id d9443c01a7336-22dbd35407bmr5533655ad.0.1745516043323;
        Thu, 24 Apr 2025 10:34:03 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5100c4esm16270255ad.173.2025.04.24.10.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 10:34:02 -0700 (PDT)
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
	Andrew Jones <ajones@ventanamicro.com>,
	Deepak Gupta <debug@rivosinc.com>
Subject: [PATCH v6 03/14] riscv: sbi: add new SBI error mappings
Date: Thu, 24 Apr 2025 19:31:50 +0200
Message-ID: <20250424173204.1948385-4-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424173204.1948385-1-cleger@rivosinc.com>
References: <20250424173204.1948385-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_103404_243140_54D7145B 
X-CRM114-Status: UNSURE (   7.59  )
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

QSBmZXcgbmV3IGVycm9ycyBoYXZlIGJlZW4gYWRkZWQgd2l0aCBTQkkgVjMuMCwgbWFwcyB0aGVt
IGFzIGNsb3NlIGFzCnBvc3NpYmxlIHRvIGVycm5vIHZhbHVlcy4KClNpZ25lZC1vZmYtYnk6IENs
w6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZHJldyBK
b25lcyA8YWpvbmVzQHZlbnRhbmFtaWNyby5jb20+Ci0tLQogYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9zYmkuaCB8IDEwICsrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCsp
CgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9zYmkuaCBiL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vc2JpLmgKaW5kZXggYmIwNzdkMGM5MTJmLi43ZWMyNDlmZWE4ODAgMTAwNjQ0
Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc2JpLmgKKysrIGIvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9zYmkuaApAQCAtNTM2LDExICs1MzYsMjEgQEAgc3RhdGljIGlubGluZSBpbnQgc2Jp
X2Vycl9tYXBfbGludXhfZXJybm8oaW50IGVycikKIAljYXNlIFNCSV9TVUNDRVNTOgogCQlyZXR1
cm4gMDsKIAljYXNlIFNCSV9FUlJfREVOSUVEOgorCWNhc2UgU0JJX0VSUl9ERU5JRURfTE9DS0VE
OgogCQlyZXR1cm4gLUVQRVJNOwogCWNhc2UgU0JJX0VSUl9JTlZBTElEX1BBUkFNOgorCWNhc2Ug
U0JJX0VSUl9JTlZBTElEX1NUQVRFOgogCQlyZXR1cm4gLUVJTlZBTDsKKwljYXNlIFNCSV9FUlJf
QkFEX1JBTkdFOgorCQlyZXR1cm4gLUVSQU5HRTsKIAljYXNlIFNCSV9FUlJfSU5WQUxJRF9BRERS
RVNTOgogCQlyZXR1cm4gLUVGQVVMVDsKKwljYXNlIFNCSV9FUlJfTk9fU0hNRU06CisJCXJldHVy
biAtRU5PTUVNOworCWNhc2UgU0JJX0VSUl9USU1FT1VUOgorCQlyZXR1cm4gLUVUSU1FOworCWNh
c2UgU0JJX0VSUl9JTzoKKwkJcmV0dXJuIC1FSU87CiAJY2FzZSBTQklfRVJSX05PVF9TVVBQT1JU
RUQ6CiAJY2FzZSBTQklfRVJSX0ZBSUxVUkU6CiAJZGVmYXVsdDoKLS0gCjIuNDkuMAoKCi0tIApr
dm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
