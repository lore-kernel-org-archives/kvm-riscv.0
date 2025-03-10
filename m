Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8089C35FF2
	for <kvm-riscv@archiver.kernel.org>; Mon, 10 Mar 2025 15:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/5CXxImi+vE0qZ2T1J02/D/9Wke2Hhzi7nLkHN+vJq8=; b=I4oQ5R5jFu3TpL
	yKFDYEOw3n62ycN9xPej0FH2loOQB5/+y3lFkqUG4tHXuxlPxhT/LYKHtLRouyw46uXoEtzXJr/jv
	Cgj+5Tl3FDsDCTgtZ2UvHdCo4n3+n16p3iJbXqunchRPLi/V3P+GIXEggDqK5E0EhPSLiE9lfbIXB
	iktdJvzVdSCMTGe8TUofMg0LUqgWh9UrseD6ykg9f+I9hn1DmXQVzGQ6q5rIGslXQAraGU+rIC1DN
	+xoNN0Rglexn88KruMC0+vhgaMskHbFcv0AWrmAtRA6ABa68Hdaw3FRln7JUXZtv6609DYi0dl19f
	lG9igOyItHuHZ4IL162w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trfLt-00000003Fw1-1qQK;
	Mon, 10 Mar 2025 15:47:37 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1treor-000000037du-1Kan
	for kvm-riscv@lists.infradead.org;
	Mon, 10 Mar 2025 15:13:30 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2235189adaeso72912215ad.0
        for <kvm-riscv@lists.infradead.org>; Mon, 10 Mar 2025 08:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741619609; x=1742224409; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CP/QN2TKpQVKty1QPq9K94rdshw9XjhsCR/clUjZxuE=;
        b=RWKI2/Zvh4sAGHgYxNblMeETjQaSygY0Ih6UtJsg6nQy/GdhMy5Kk2BGm3r7h9Wg0T
         ALMlgDXSQ1MDr9YRJQKf4FHzfEuy8IVBv99IZ+JPk5LoTFZhjcCn0n1IVEGUo1kD3UIQ
         6tIqfTqZ49Qg/mWztBXsk7FafO11rPgw90IS4mWLoW8iGP+oR6gTsIEVgVNazci/oeCo
         uPJBa7CY2wfAEx/S5BEWVMJX3Jb6mRj0swEeeLw9YY1wQ1gMNY86pxDm14DY/R6xhMnv
         2LOrMOPvgho8IAxOFbC6srA/Cnd1lv81vVrWAo5JBWjaZVtvD/lu7fRx7Ln1pc4yTW7k
         uiUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741619609; x=1742224409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CP/QN2TKpQVKty1QPq9K94rdshw9XjhsCR/clUjZxuE=;
        b=hJKCf1otpP+pDpNVEgdQIe4EnH93GWpVujhPfV7lbp0Y3GLZQh25xr84nX7k8KVmZs
         FyUj6lClXzauig4nOLxQBx4jErDjL2G2Ytfag7uZ2RLi02Tup1/mdaJemZUHSm6sJvcf
         0D3Epxs0iLBt2JH2TzQN2xp4T0u7Pmh9Of1xvniTzSFDmV4sfNJ4nauTYWgIn+0ohcmS
         OJ0BXshfdJxvWh3vPxlj+X9korv7SHWFv51jCfdTTYcPDFHrq1Tp6ielt9aQc2PQf7RJ
         kSjiBwnrXde4c/Yd9i5DcnMG6seIJdoHZJluDrY+6bpStgllNTCLmQw21g2ZEbpGnBV1
         noMw==
X-Forwarded-Encrypted: i=1; AJvYcCWaWUp6898jvFJQ5CCVKrkXBBvSHUVmiU6OQDQXaCqoGNF5uLyqUkai4S7ZZoBz2qPMlyGe+4C7l0k=@lists.infradead.org
X-Gm-Message-State: AOJu0YymVjSZJlNf8geQOzKDPJZYuaICuAqGFGva0Whkmg5hmDs/81jO
	ySA2+GmNPs/fEdY1dixY/S3dSFQfwpC/no7eR48Go80QfhgTs6g/pruCExz4jyI=
X-Gm-Gg: ASbGncvvQ+CfEsDUh1EovGRLFPjAQniL5ziiKLPj30OS8mJJj/KAGNpL9sHG1XPGI8f
	+hcnwN1azuI0u6HuQuRHgJjmt5M8q+ki/NvzHWZB3vi5OuOKJjBy63LoFOYs/6Ld4KV14FA0INC
	gHwo5oPsAbsL+JaYVnQaAqrB0wDTFpSDKZdjwDd/fiO/c06Kn6av3efZF6Fu3P1D+lP8/loqfjZ
	SzrZhuJEvuce8p4ykpTzdTZFLNNVMuaMJjbzL1K3YBj5z5t+vkP/JfBXVHcq/KIjxecS1OuY6be
	SBmXYY6fDkvgfM1dKSUoDHXA72v8GnX1CgRimBdOfcZHs9Ava8CfbOY2
X-Google-Smtp-Source: AGHT+IE/CwbxNhDp7rRzvfmLqzJMclwTPVUcQ5dvDrzAMSsXdg6waC3I4WKcj3iwXpglVe985eMicg==
X-Received: by 2002:a17:902:e84c:b0:21f:40de:ae4e with SMTP id d9443c01a7336-2245360f020mr151160385ad.9.1741619608740;
        Mon, 10 Mar 2025 08:13:28 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-224109e99dfsm79230515ad.91.2025.03.10.08.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 08:13:28 -0700 (PDT)
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
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v3 05/17] riscv: misaligned: use on_each_cpu() for scalar misaligned access probing
Date: Mon, 10 Mar 2025 16:12:12 +0100
Message-ID: <20250310151229.2365992-6-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250310151229.2365992-1-cleger@rivosinc.com>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_081329_354990_C54D2474 
X-CRM114-Status: GOOD (  12.38  )
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

c2NoZWR1bGVfb25fZWFjaF9jcHUoKSB3YXMgdXNlZCB3aXRob3V0IGFueSBnb29kIHJlYXNvbiB3
aGlsZSBkb2N1bWVudGVkCmFzIHZlcnkgc2xvdy4gVGhpcyBjYWxsIHdhcyBpbiB0aGUgYm9vdCBw
YXRoLCBzbyBiZXR0ZXIgdXNlCm9uX2VhY2hfY3B1KCkgZm9yIHNjYWxhciBtaXNhbGlnbmVkIGNo
ZWNraW5nLiBWZWN0b3IgbWlzYWxpZ25lZCBjaGVjawpzdGlsbCBuZWVkcyB0byB1c2Ugc2NoZWR1
bGVfb25fZWFjaF9jcHUoKSBzaW5jZSBpdCByZXF1aXJlcyBpcnFzIHRvIGJlCmVuYWJsZWQgYnV0
IHRoYXQncyBsZXNzIG9mIGEgcHJvYmxlbSBzaW5jZSB0aGlzIGNvZGUgaXMgcmFuIGluIGEga3Ro
cmVhZC4KQWRkIGEgY29tbWVudCB0byBleHBsaWNpdCB0aGF0LgoKU2lnbmVkLW9mZi1ieTogQ2zD
qW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgotLS0KIGFyY2gvcmlzY3Yva2VybmVs
L3RyYXBzX21pc2FsaWduZWQuYyB8IDkgKysrKysrKy0tCiAxIGZpbGUgY2hhbmdlZCwgNyBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVs
L3RyYXBzX21pc2FsaWduZWQuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2FsaWduZWQu
YwppbmRleCA5MGFjNzQxOTEzNTcuLmZmYWM0MjRmYWE4OCAxMDA2NDQKLS0tIGEvYXJjaC9yaXNj
di9rZXJuZWwvdHJhcHNfbWlzYWxpZ25lZC5jCisrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBz
X21pc2FsaWduZWQuYwpAQCAtNjE2LDYgKzYxNiwxMSBAQCBib29sIGNoZWNrX3ZlY3Rvcl91bmFs
aWduZWRfYWNjZXNzX2VtdWxhdGVkX2FsbF9jcHVzKHZvaWQpCiAJCXJldHVybiBmYWxzZTsKIAl9
CiAKKwkvKgorCSAqIFdoaWxlIGJlaW5nIGRvY3VtZW50ZWQgYXMgdmVyeSBzbG93LCBzY2hlZHVs
ZV9vbl9lYWNoX2NwdSgpIGlzIHVzZWQKKwkgKiBzaW5jZSBrZXJuZWxfdmVjdG9yX2JlZ2luKCkg
dGhhdCBpcyBjYWxsZWQgaW5zaWRlIHRoZSB2ZWN0b3IgY29kZQorCSAqIGV4cGVjdHMgaXJxcyB0
byBiZSBlbmFibGVkIG9yIGl0IHdpbGwgcGFuaWMoKS4KKwkgKi8KIAlzY2hlZHVsZV9vbl9lYWNo
X2NwdShjaGVja192ZWN0b3JfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZCk7CiAKIAlmb3JfZWFj
aF9vbmxpbmVfY3B1KGNwdSkKQEAgLTYzNiw3ICs2NDEsNyBAQCBib29sIGNoZWNrX3ZlY3Rvcl91
bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkX2FsbF9jcHVzKHZvaWQpCiAKIHN0YXRpYyBib29sIHVu
YWxpZ25lZF9jdGwgX19yZWFkX21vc3RseTsKIAotc3RhdGljIHZvaWQgY2hlY2tfdW5hbGlnbmVk
X2FjY2Vzc19lbXVsYXRlZChzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmsgX19hbHdheXNfdW51c2Vk
KQorc3RhdGljIHZvaWQgY2hlY2tfdW5hbGlnbmVkX2FjY2Vzc19lbXVsYXRlZCh2b2lkICphcmcg
X19hbHdheXNfdW51c2VkKQogewogCWludCBjcHUgPSBzbXBfcHJvY2Vzc29yX2lkKCk7CiAJbG9u
ZyAqbWFzX3B0ciA9IHBlcl9jcHVfcHRyKCZtaXNhbGlnbmVkX2FjY2Vzc19zcGVlZCwgY3B1KTsK
QEAgLTY3Nyw3ICs2ODIsNyBAQCBib29sIGNoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWRf
YWxsX2NwdXModm9pZCkKIAkgKiBhY2Nlc3NlcyBlbXVsYXRlZCBzaW5jZSB0YXNrcyByZXF1ZXN0
aW5nIHN1Y2ggY29udHJvbCBjYW4gcnVuIG9uIGFueQogCSAqIENQVS4KIAkgKi8KLQlzY2hlZHVs
ZV9vbl9lYWNoX2NwdShjaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkKTsKKwlvbl9lYWNo
X2NwdShjaGVja191bmFsaWduZWRfYWNjZXNzX2VtdWxhdGVkLCBOVUxMLCAxKTsKIAogCWZvcl9l
YWNoX29ubGluZV9jcHUoY3B1KQogCQlpZiAocGVyX2NwdShtaXNhbGlnbmVkX2FjY2Vzc19zcGVl
ZCwgY3B1KQotLSAKMi40Ny4yCgoKLS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9rdm0tcmlzY3YK
