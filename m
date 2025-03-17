Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F395C35FF9
	for <kvm-riscv@archiver.kernel.org>; Mon, 17 Mar 2025 16:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N/SFn797h28uEQataGubX8rOW6LNUld6Y98CAayfA0c=; b=hBYVQHrSoq5qxH
	zBZZRgLF4gCcAHbldEPjqY5VIfri/2APn36qJ7SmapIEwRs3eR5HHgrMhqGtxLvvxFUn4VXETIVz1
	kyaYZkLaSFozNeikp1+cM2KSKKsYlzT6A8a+PKts+w2tdr16EA1J5A4Wz4jbPqgL9pBhoUVMp2flz
	CjMsSUUZSnDjhbfu5zW91Kz5grWEP8CAd+HijmPZ/GFO9YbLuZ70wLiivF1HKpz4jfLNbFZTRuT8H
	lRt2sJCJaQ1Y87hlgOXvswiz07Kszre2j3Z/vmL+Mri3UHqSUFo+hVl/ENrSuyMiO2Sx0Luqpt9iD
	HpPTM/a+4TOxzJY454lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuDeq-00000003OxY-3wmf;
	Mon, 17 Mar 2025 16:49:44 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuDeo-00000003OvJ-26AR
	for kvm-riscv@lists.infradead.org;
	Mon, 17 Mar 2025 16:49:43 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-390cf7458f5so4084249f8f.2
        for <kvm-riscv@lists.infradead.org>; Mon, 17 Mar 2025 09:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742230181; x=1742834981; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gp1/a4HJMNi1Mi5InH5hHHDY+xPb3C4W59LQWScL2LY=;
        b=L8Xp9hqWt8t+5Yy8AjRI5N7kmQbqNRfDjlyABzO6Be8sNMBB/i45s1DF9bUV5tTnYj
         uL75sXsr2I1Q/bIQJyjrJthQCVch+7fTewGbBkPr4VPSbbw8V3N1lYDn+gS9wVhQ8DDW
         oEfp8DY7nA+M9tzqpd9ZoLbVqxpQeSXlaudPtWcvYr1zKF3SZPto6sbjAQguH/Azf4nY
         MsC/at6enSaFqDWmENUu8L/X5SRZ8l7Gr9RatiVpiY4frnrByI5yd3338smtLRj6+/xv
         fDnM67C7XRoc08K2MMRy45R+cgYDP6YcskhbiQlVuxVXsbgt63Ksk7Y8BySebiTawLF7
         ztgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742230181; x=1742834981;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gp1/a4HJMNi1Mi5InH5hHHDY+xPb3C4W59LQWScL2LY=;
        b=Ob9QfyIOl3ZnfNJRjhWaEYTrR8ZFUyionNEpnZeDe9Jx6DaUBitRfVxSg8oLiJ41VA
         LgsrfFWceajUxA+tIo//QnlnLotn4L6LfIRLZ7muD6PpXf/4ZoXipG3buQhu9sxll3bG
         UJ+aX+inwniCq3W+76m3j+5EVqWCvw42dkkGCJAN2KoHnqvmAPW5mNZNpFMCvFbrhss3
         ofyO5BYAU6wAfne82O24tULQcDEYOgf+W5Puf02X5mCpVTLH7JcSSxCz0YhAtuwKtvCY
         ubwW5+fAFb0tXxZXH9blJxJvPpTbnro7pRmO24pfFJtmgOghtocmY63a4e1148PtSHlb
         bwMA==
X-Forwarded-Encrypted: i=1; AJvYcCU2HqexZLtIZypBGLUBGZszTI965qiuqslJ3PzW5+/0UEUXqIgu17tktWbmRstT/pcF0iDgSd6gTWc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/2BqkjuGFoNPWXx7MuBDnSpQblidLJ2sIYkn+8HAGnkNEPrdc
	cUHSkcVcS+34IXrFkA7xrIeT9f8c4ET5pIXHDdcyhUi9FNPHiG3GN/Oeq0POzc0=
X-Gm-Gg: ASbGnctQ7TLQJehoOBF5uuhVg390OBVoJvEf6fypxjGozlmq+H6ibt/sKRehMernxMD
	gXn5TSbo/X3blzy2HG3EPVKSdbH1WEJXG22U1ZuYLxgaCBGdtzrniPX2FJ0IQIOXmBoBgf789Yz
	KFD76nUzKKUtt85lz5W6a2iZ6dcsv0WZLApJMFnl0Z8Qz/MFC6SuujFR5cqKEAUKNGc6Cl01XqX
	QeHrEnEzJaS6cNmcQastEA3eqB0Qu2P/nBnVw2xx3FRYs1Po6FYb2Pz0aRsU7JxYlwtpZb9TWQl
	c6bEFq12CffJ+1m27733YVPD6uSlLiUziZO29UJyGYR8Mw==
X-Google-Smtp-Source: AGHT+IEh8zHBaUIIXKuvqFdTMq+3vL10WSh07vIZILI17IOXbqDNPXZu4MtQo86xNhPGSU1HmXD2bg==
X-Received: by 2002:a05:6000:1a85:b0:390:e9b5:d69c with SMTP id ffacd0b85a97d-3971e876827mr15899371f8f.25.1742230180661;
        Mon, 17 Mar 2025 09:49:40 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395cb318a80sm15785845f8f.61.2025.03.17.09.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 09:49:39 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <andrew.jones@linux.dev>
Subject: [kvm-unit-tests PATCH v11 2/8] riscv: Set .aux.o files as .PRECIOUS
Date: Mon, 17 Mar 2025 17:46:47 +0100
Message-ID: <20250317164655.1120015-3-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250317164655.1120015-1-cleger@rivosinc.com>
References: <20250317164655.1120015-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_094942_533520_A092D7CE 
X-CRM114-Status: UNSURE (   7.96  )
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

V2hlbiBjb21waWxpbmcsIHdlIG5lZWQgdG8ga2VlcCAuYXV4Lm8gZmlsZSBvciB0aGV5IHdpbGwg
YmUgcmVtb3ZlZAphZnRlciB0aGUgY29tcGlsYXRpb24gd2hpY2ggbGVhZHMgdG8gZGVwZW5kZW50
IGZpbGVzIHRvIGJlIHJlY29tcGlsZWQuClNldCB0aGVzZSBmaWxlcyBhcyAuUFJFQ0lPVVMgdG8g
a2VlcCB0aGVtLgoKU2lnbmVkLW9mZi1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3Np
bmMuY29tPgpSZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxhbmRyZXcuam9uZXNAbGludXguZGV2
PgotLS0KIHJpc2N2L01ha2VmaWxlIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24o
KykKCmRpZmYgLS1naXQgYS9yaXNjdi9NYWtlZmlsZSBiL3Jpc2N2L01ha2VmaWxlCmluZGV4IDUy
NzE4ZjNmLi5hZTljZjAyYSAxMDA2NDQKLS0tIGEvcmlzY3YvTWFrZWZpbGUKKysrIGIvcmlzY3Yv
TWFrZWZpbGUKQEAgLTkwLDYgKzkwLDcgQEAgQ0ZMQUdTICs9IC1JICQoU1JDRElSKS9saWIgLUkg
JChTUkNESVIpL2xpYi9saWJmZHQgLUkgbGliIC1JICQoU1JDRElSKS9yaXNjdgogYXNtLW9mZnNl
dHMgPSBsaWIvcmlzY3YvYXNtLW9mZnNldHMuaAogaW5jbHVkZSAkKFNSQ0RJUikvc2NyaXB0cy9h
c20tb2Zmc2V0cy5tYWsKIAorLlBSRUNJT1VTOiAlLmF1eC5vCiAlLmF1eC5vOiAkKFNSQ0RJUikv
bGliL2F1eGluZm8uYwogCSQoQ0MpICQoQ0ZMQUdTKSAtYyAtbyAkQCAkPCBcCiAJCS1EUFJPR05B
TUU9XCIkKG5vdGRpciAkKEA6LmF1eC5vPS4kKGV4ZSkpKVwiIC1EQVVYRkxBR1M9JChBVVhGTEFH
UykKLS0gCjIuNDcuMgoKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8va3ZtLXJpc2N2Cg==
