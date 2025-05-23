Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DC0EC54ED0
	for <kvm-riscv@archiver.kernel.org>; Fri, 23 May 2025 10:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xdxdlkXXHf4Z/DDXLQ8keeLnNRlUsyIPuRt618oznSk=; b=P7fmahjRkUJ+xg
	ZXr57MctOIs1W/iofMtkDcthGV6EfO1P+5g0iesdGRX66sJIPbgUoh67DzEmHbSK2mzsolWgVuU0t
	6pHp1wQpef3J3uRU4vkZnEbfiJIhHz3q1ktFRMgpnbUvcD2MRWDf4jfexE+9X5Mcy5FtVMvHPzTpZ
	DR2YjUVOitGftmojBLMnse0Y9wN735dKhufn2ys4luAh3N88HJIj+gLJJSnBiE301J+G4o0vplRDG
	X8itSGcVs3mvH4kjEftFRPOp1yJHb1sYY+zPXPrwDwmnvPErkaM2VU0VWQ2H1lWEcQS1JSqbTfizl
	9/9VW5BxkwZzKCV3Lpsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIPXp-00000003a2H-1dPw;
	Fri, 23 May 2025 10:22:29 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIPXl-00000003Zzm-1NMH
	for kvm-riscv@lists.infradead.org;
	Fri, 23 May 2025 10:22:28 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-742b614581dso7481550b3a.3
        for <kvm-riscv@lists.infradead.org>; Fri, 23 May 2025 03:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747995744; x=1748600544; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SJlHvKZgzBuDLrZteqciLWVF8ALRj3f5YDjK6RzEUVA=;
        b=i5Oegpb7zKgdRII3hJfFIW182s81XV3JX4j6rRq1MzKYO3Xig3VQu/YMoX6ipkjcpb
         +mRrPrC30ZUygekXu//VKVUAQ7DBV7r6wUWSIj54uzbseApCyyfBDzfXXguBoNsQH0e0
         iOWmVf9O1qIVsp8693LYDUu13k3K/VXo96fKYntkO6Tq3QG3/H9PyvJ9ocNz2i3AR5Sn
         ARAryGRCKjCi7fQGz7E9qTV08dsR4m34tOupWkolDE8gYZopMB2k6hGsc8TcztpJkBBK
         SmnnPm4DoAPMoDe183rLd9QN52b9FxvluoJK2YonQ7HbQ0YIqbeUyagkR+9umVLRMj4d
         KWaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747995744; x=1748600544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SJlHvKZgzBuDLrZteqciLWVF8ALRj3f5YDjK6RzEUVA=;
        b=gp4KVsn0pq8DlzlZ6O0bwxo05W0Y/NF2FdwI+r5dKAcux5BrHJw5NO3grAmvuWznDB
         N81uz3d1Ort52XoGOal663aXiUxYKNas8IfJp+6xsPuDIsyFlXafLOWUbmWZ2eXr8C7l
         8z46kWlVqovNnAyZyrpNcuNxsWFnSeaUVF/7w1f9gBUSrZZb6cdCpsCbpHdQi0PpTrRV
         vwoxQZfcneQ3iMGBuoDvsv5BKq4Ln1vesC2+jQFWM9WZiqNv+zt3/9NIqeuL9WxxRmfQ
         YR4cSPxsRG6dHfneNtaziyDPR8rjBYrUSDNjx51Rj8E5xLco3dylnCtjZgVNTuz0ezLb
         2gXw==
X-Forwarded-Encrypted: i=1; AJvYcCUWZaIbJMoqBG9tEUUyNUXFZu5EnxXxRpmF8P4HZ2tTeTHLaSPGpdN/gUCfLlVfyTfouAlXtdk18iQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YwcYdGnBcG/dGq92uG+8iSC2VUqAaefBkKYr2fyfcMnIuN7zCdp
	jZL4Gz4tp2Pn2HX2r+OXnb7qxLkl7JRbNU+MdnjgA7JcCS2BiqFL3ot2j6sz6XFVNag=
X-Gm-Gg: ASbGncsYdSSsVpxtoy7bUJ1ILOPo8oHiKbTnmyNr412Hw8QUoZbd69oH3C0UQoYFWvj
	Aw6IQPhCA2sxd51id0+ze5OBTKGDmhu9pvtv3GJ49VyNDn9bTbLvHoFUU7QpkiiddmBC9z4ziUO
	XWIeJ2W0Cm92ALaAfpsFeWnYt8chovBhnjJUDFJkGGQhnwxyXG91wbX8QwRfcJ2Jbhh62RMNEN8
	65N5r9Sij4xl+iAF7w8aGmHNomyc9ivJGGCwid/GJRrrZesP4UQODrwNdmR8V6tjSO1Zo4Q8vP1
	ElYBLJn2kM1Fwq8mP26ncYEBZursxwIIvBwyM7VJGa6bWsM3sJ3m
X-Google-Smtp-Source: AGHT+IGKDj0Vt3rsaPKYZL2nBjHo4cZKOOLzPGlgQIfiludDyBY6vduzzuNU0u8N497C+aWPSTsTOQ==
X-Received: by 2002:a05:6a00:3e0b:b0:736:34a2:8a18 with SMTP id d2e1a72fcca58-742acd75e6amr44078224b3a.24.1747995744354;
        Fri, 23 May 2025 03:22:24 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9829ce8sm12466688b3a.118.2025.05.23.03.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 03:22:23 -0700 (PDT)
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
	Deepak Gupta <debug@rivosinc.com>,
	Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v8 10/14] riscv: misaligned: add a function to check misalign trap delegability
Date: Fri, 23 May 2025 12:19:27 +0200
Message-ID: <20250523101932.1594077-11-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250523101932.1594077-1-cleger@rivosinc.com>
References: <20250523101932.1594077-1-cleger@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_032225_371561_7A27FF96 
X-CRM114-Status: GOOD (  11.62  )
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

Q2hlY2tpbmcgZm9yIHRoZSBkZWxlZ2FiaWxpdHkgb2YgdGhlIG1pc2FsaWduZWQgYWNjZXNzIHRy
YXAgaXMgbmVlZGVkCmZvciB0aGUgS1ZNIEZXRlQgZXh0ZW5zaW9uIGltcGxlbWVudGF0aW9uLiBB
ZGQgYSBmdW5jdGlvbiB0byBnZXQgdGhlCmRlbGVnYWJpbGl0eSBvZiB0aGUgbWlzYWxpZ25lZCB0
cmFwIGV4Y2VwdGlvbi4KClNpZ25lZC1vZmYtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJp
dm9zaW5jLmNvbT4KUmV2aWV3ZWQtYnk6IEFuZHJldyBKb25lcyA8YWpvbmVzQHZlbnRhbmFtaWNy
by5jb20+Ci0tLQogYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmggIHwgIDYgKysr
KysrCiBhcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMgfCAxNyArKysrKysrKysr
KysrKystLQogMiBmaWxlcyBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1ZmVhdHVyZS5oIGIvYXJj
aC9yaXNjdi9pbmNsdWRlL2FzbS9jcHVmZWF0dXJlLmgKaW5kZXggMmJmYTRlZjM4M2VkLi5mYmQw
ZTQzMDZjOTMgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1ZmVhdHVyZS5o
CisrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3B1ZmVhdHVyZS5oCkBAIC04MSw2ICs4MSwx
MiBAQCBzdGF0aWMgaW5saW5lIGJvb2wgdW5hbGlnbmVkX2N0bF9hdmFpbGFibGUodm9pZCkKIAog
I2lmIGRlZmluZWQoQ09ORklHX1JJU0NWX01JU0FMSUdORUQpCiBERUNMQVJFX1BFUl9DUFUobG9u
ZywgbWlzYWxpZ25lZF9hY2Nlc3Nfc3BlZWQpOworYm9vbCBtaXNhbGlnbmVkX3RyYXBzX2Nhbl9k
ZWxlZ2F0ZSh2b2lkKTsKKyNlbHNlCitzdGF0aWMgaW5saW5lIGJvb2wgbWlzYWxpZ25lZF90cmFw
c19jYW5fZGVsZWdhdGUodm9pZCkKK3sKKwlyZXR1cm4gZmFsc2U7Cit9CiAjZW5kaWYKIAogYm9v
bCBfX2luaXQgY2hlY2tfdmVjdG9yX3VuYWxpZ25lZF9hY2Nlc3NfZW11bGF0ZWRfYWxsX2NwdXMo
dm9pZCk7CmRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMg
Yi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMKaW5kZXggN2VjYWE4MTAzZmU3
Li45MzA0MzkyNGZlNmMgMTAwNjQ0Ci0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYXBzX21pc2Fs
aWduZWQuYworKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwc19taXNhbGlnbmVkLmMKQEAgLTcy
NCwxMCArNzI0LDEwIEBAIHN0YXRpYyBpbnQgY3B1X29ubGluZV9jaGVja191bmFsaWduZWRfYWNj
ZXNzX2VtdWxhdGVkKHVuc2lnbmVkIGludCBjcHUpCiB9CiAjZW5kaWYKIAotI2lmZGVmIENPTkZJ
R19SSVNDVl9TQkkKLQogc3RhdGljIGJvb2wgbWlzYWxpZ25lZF90cmFwc19kZWxlZ2F0ZWQ7CiAK
KyNpZmRlZiBDT05GSUdfUklTQ1ZfU0JJCisKIHN0YXRpYyBpbnQgY3B1X29ubGluZV9zYmlfdW5h
bGlnbmVkX3NldHVwKHVuc2lnbmVkIGludCBjcHUpCiB7CiAJaWYgKHNiaV9md2Z0X3NldChTQklf
RldGVF9NSVNBTElHTkVEX0VYQ19ERUxFRywgMSwgMCkgJiYKQEAgLTc2Myw2ICs3NjMsNyBAQCBz
dGF0aWMgaW50IGNwdV9vbmxpbmVfc2JpX3VuYWxpZ25lZF9zZXR1cCh1bnNpZ25lZCBpbnQgY3B1
IF9fYWx3YXlzX3VudXNlZCkKIHsKIAlyZXR1cm4gMDsKIH0KKwogI2VuZGlmCiAKIGludCBjcHVf
b25saW5lX3VuYWxpZ25lZF9hY2Nlc3NfaW5pdCh1bnNpZ25lZCBpbnQgY3B1KQpAQCAtNzc1LDMg
Kzc3NiwxNSBAQCBpbnQgY3B1X29ubGluZV91bmFsaWduZWRfYWNjZXNzX2luaXQodW5zaWduZWQg
aW50IGNwdSkKIAogCXJldHVybiBjcHVfb25saW5lX2NoZWNrX3VuYWxpZ25lZF9hY2Nlc3NfZW11
bGF0ZWQoY3B1KTsKIH0KKworYm9vbCBtaXNhbGlnbmVkX3RyYXBzX2Nhbl9kZWxlZ2F0ZSh2b2lk
KQoreworCS8qCisJICogRWl0aGVyIHdlIHN1Y2Nlc3NmdWxseSByZXF1ZXN0ZWQgbWlzYWxpZ25l
ZCB0cmFwcyBkZWxlZ2F0aW9uIGZvciBhbGwKKwkgKiBDUFVzLCBvciB0aGUgU0JJIGRvZXMgbm90
IGltcGxlbWVudCB0aGUgRldGVCBleHRlbnNpb24gYnV0IGRlbGVnYXRlZAorCSAqIHRoZSBleGNl
cHRpb24gYnkgZGVmYXVsdC4KKwkgKi8KKwlyZXR1cm4gbWlzYWxpZ25lZF90cmFwc19kZWxlZ2F0
ZWQgfHwKKwkgICAgICAgYWxsX2NwdXNfdW5hbGlnbmVkX3NjYWxhcl9hY2Nlc3NfZW11bGF0ZWQo
KTsKK30KK0VYUE9SVF9TWU1CT0xfR1BMKG1pc2FsaWduZWRfdHJhcHNfY2FuX2RlbGVnYXRlKTsK
LS0gCjIuNDkuMAoKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
a3ZtLXJpc2N2Cg==
