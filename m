Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E504E77188
	for <kvm-riscv@archiver.kernel.org>; Fri, 10 Jan 2025 08:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=15lz5OCuj+WDjLRahH/+B113NKAvU6Ul3lb3q/Zu7zI=; b=Nky/YpgiecER3V
	TPrXu1l5QPKeCAy7prF1ZodgZss4piHx7KkG8HnWVMSM6Lxyr0DNL8R8uWroh9h99r2D9qRoQqELm
	8UWLOzHned0EtZtqK6+moteFayYUDdYmASanFWwCaiCCdYEcbwIu/YP6D/0guiaTMKcWwwNXPG+JH
	nu8eWklbPthGDcKLi3fnaYMwWY301aiZSFUjiXii9NRHuw1wIzLLgLn1x+Gm132Z5uYtMVVYKbpPy
	3aTh1gDPn0ZCmccX0z2I89W5E5l3GM/mzqiJ/447WCljkuHyaWcGCPWPav0qV0W5PLdX+eeFO5Mz5
	cmUt3tzmQYNcnX+CCmMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWAmJ-0000000EbkE-00Qd;
	Fri, 10 Jan 2025 08:54:03 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWAmH-0000000Ebjc-1EQ3
	for kvm-riscv@lists.infradead.org;
	Fri, 10 Jan 2025 08:54:02 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-385e06af753so971795f8f.2
        for <kvm-riscv@lists.infradead.org>; Fri, 10 Jan 2025 00:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736499239; x=1737104039; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z/vmys0EVuwB0xKk+EZlTCl6zKgMXosmjoUNe63DhnQ=;
        b=OWsiXB36tj+BENaHF9OwKoATQdpVm4SfgplmcNcPq1/ln7peCaFZnisRxKsq0iesfW
         XzoX7Kak+Hgs17uvISWPvzUMgfO2RLI+alL3D/vcyCkUSGOTAYJ3vtjX3vfiJ2wKu/ZQ
         vEf9uRET2qk5YuzYn1igtFOhqmVCeIaGs3g5DsJObRO4+dsEjmqt/FEc5JZAOVQq6rQ8
         Ph52TUrXaagUM8nzy0D/1rJ1oYdDscfdCIBnKZCrY/GYgX6JoAodV+BaRC/iPT3utokN
         BR/TZjxF95kZGnhW30jZYV+gdFebxg1EiTM6Q/TYmjQIQsxILsK5JhicjqhsuEgBTNiX
         nP8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736499239; x=1737104039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z/vmys0EVuwB0xKk+EZlTCl6zKgMXosmjoUNe63DhnQ=;
        b=R0BFToGSP0FUoy2cLu/IJmOPonXcE2tzCRtxDqcCnkc3NyHJFznDdBo0rtVpNEzQs7
         xVf7SnHCDIMYec7OrqrMQOdADjcBVegtd1IIAdzlUE7O5o2mfWlL4Cvo5v36/x6/08IR
         CTaTzFMh8uxauL2JNcdfHQ07uu0xLCUN6ORo2ut7xuJS7Kr4A5hPEMu4kBG1nppP2TDw
         gw1AG4eZPvKm3YSk79NsXZkJmqoyWCZqoErCOljYrgn0l9bgQjsGa1YUlyJEUe3yozBw
         EI1H8JRQEY2koclY6MCT4WulAkd5DROpqa6d6HAkPYkWVVMfn5oMQjv8V7vBU/3H9yz9
         zLQg==
X-Forwarded-Encrypted: i=1; AJvYcCXtDOqoV2btAihZcQ/cxpVUAyCtkjKbcRAzC3Oxp+QZYIaGJdoEDt8Xr6y6652akRFEsWUkF0gTN0g=@lists.infradead.org
X-Gm-Message-State: AOJu0YxOegCW5jpPM63jxmvqSXepnvrnK4NRJZzBQ5tbudLPq1pBZmr1
	9V6cIp5pUHFrgUw6//8xGQDpf350tkvLy759PW9+Gtcu6vpKwWZKjbWUZnZ+SscWGnzXs/JHZyG
	M
X-Gm-Gg: ASbGncs4JCHukH+/qkkUIrZO9h+kZkIJ9G3WT36VppsM0+2lSlLRtBfVT7YitrxAeRJ
	EzeQFlhXh2fpKYSI1DKC51hejVPYUs+ZT9YnTN845fbnYoQj45cmZtg9nPmDP8yNPGElnzLh42J
	jCHTyc5tsUP6NflwTeaGISwJkeCBykhxJiVRKgOLAcc6XI0eP15YRuqFZe8SVjtPcY3ZIZJGOgN
	bpdjRGTmcvmH0dOXPbnJ1dne19WAnE5yyMc/Ug4aKoJiH9wUyezUa+lBQ==
X-Google-Smtp-Source: AGHT+IHUDt07t5Oqoev2Rxl3n1F1zN41WKhamAhtCNOOIbQ11tERVZqurci5ma4ZojCPiSYV/OEFLg==
X-Received: by 2002:a5d:47a6:0:b0:385:f195:2a8 with SMTP id ffacd0b85a97d-38a87312734mr9091920f8f.30.1736499239125;
        Fri, 10 Jan 2025 00:53:59 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4c1ce5sm4009283f8f.94.2025.01.10.00.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 00:53:58 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [kvm-unit-tests PATCH v5 0/5] riscv: add SBI SSE extension tests
Date: Fri, 10 Jan 2025 09:51:13 +0100
Message-ID: <20250110085120.2643853-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_005401_336745_2454E5FE 
X-CRM114-Status: GOOD (  12.50  )
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

VGhpcyBzZXJpZXMgYWRkcyBhbiBpbmRpdmlkdWFsIHRlc3QgZm9yIFNCSSBTU0UgZXh0ZW5zaW9u
IGFzIHdlbGwgYXMKbmVlZGVkIGluZnJhc3RydWN0dXJlIGZvciBTU0Ugc3VwcG9ydC4gSXQgYWxz
byBhZGRzIHRlc3Qgc3BlY2lmaWMKYXNtLW9mZnNldHMgZ2VuZXJhdGlvbiB0byB1c2UgY3VzdG9t
IE9GRlNFVCBhbmQgREVGSU5FIGZyb20gdGhlIHRlc3QKZGlyZWN0b3J5LgoKLS0tCgpWNToKIC0g
VXBkYXRlIGV2ZW50IHJhbmdlcyBiYXNlZCBvbiBsYXRlc3Qgc3BlYwogLSBSZW5hbWUgYXNtLW9m
ZnNldC10ZXN0LmMgdG8gc2JpLWFzbS1vZmZzZXQuYwoKVjQ6CiAtIEZpeCB0eXBvIHNiaV9leHRf
c3NfZmlkIC0+IHNiaV9leHRfc3NlX2ZpZAogLSBBZGQgcHJvcGVyIGFzbS1vZmZzZXQgZ2VuZXJh
dGlvbiBmb3IgdGVzdHMKIC0gTW92ZSBTU0Ugc3BlY2lmaWMgZmlsZSBmcm9tIGxpYi9yaXNjdiB0
byByaXNjdi8KClYzOgogLSBBZGQgLWRlcHMgdmFyaWFibGUgZm9yIHRlc3Qgc3BlY2lmaWMgZGVw
ZW5kZW5jaWVzCiAtIEZpeCBmb3JtYXR0aW5nIGVycm9ycy90eXBvIGluIHNiaS5oCiAtIEFkZCBt
aXNzaW5nIGRvdWJsZSB0cmFwIGV2ZW50CiAtIEFscGhhYmV0aXplIHNiaS1zc2UuYyBpbmNsdWRl
cwogLSBGaXggYTYgY29udGVudCBhZnRlciB1bm1hc2tpbmcgZXZlbnQKIC0gQWRkIFNTRSBIQVJU
X01BU0svVU5NQVNLIHRlc3QKIC0gVXNlIG12IGluc3RlYWQgb2YgbW92ZQogLSBtb3ZlIHNiaV9j
aGVja19zc2UoKSBkZWZpbml0aW9uIGluIHNiaS5jCiAtIFJlbW92ZSBzYmlfc3NlIHRlc3QgZnJv
bSB1bml0ZXN0cy5jZmcKClYyOgogLSBSZWJhc2VkIG9uIG9yaWdpbi9tYXN0ZXIgYW5kIGludGVn
cmF0ZSBpdCBpbnRvIHNiaS5jIHRlc3RzCgpDbMOpbWVudCBMw6lnZXIgKDUpOgogIGtidWlsZDog
YWxsb3cgbXVsdGlwbGUgYXNtLW9mZnNldHMgZmlsZSB0byBiZSBnZW5lcmF0ZWQKICByaXNjdjog
dXNlIGFzbS1vZmZzZXRzIHRvIGdlbmVyYXRlIFNCSV9FWFRfSFNNIHZhbHVlcwogIHJpc2N2OiBB
ZGQgIi1kZXBzIiBoYW5kbGluZyBmb3IgdGVzdHMKICByaXNjdjogbGliOiBBZGQgU0JJIFNTRSBl
eHRlbnNpb24gZGVmaW5pdGlvbnMKICByaXNjdjogc2JpOiBBZGQgU1NFIGV4dGVuc2lvbiB0ZXN0
cwoKIHNjcmlwdHMvYXNtLW9mZnNldHMubWFrIHwgICAyMiArLQogcmlzY3YvTWFrZWZpbGUgICAg
ICAgICAgfCAgIDEwICstCiBsaWIvcmlzY3YvYXNtL2Nzci5oICAgICB8ICAgIDIgKwogbGliL3Jp
c2N2L2FzbS9zYmkuaCAgICAgfCAgIDg5ICsrKysKIHJpc2N2L3NiaS10ZXN0cy5oICAgICAgIHwg
ICAxMiArCiByaXNjdi9zYmktYXNtLlMgICAgICAgICB8ICAgOTYgKysrLQogcmlzY3Yvc2JpLWFz
bS1vZmZzZXRzLmMgfCAgIDE5ICsKIHJpc2N2L3NiaS1zc2UuYyAgICAgICAgIHwgMTA2MCArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKIHJpc2N2L3NiaS5jICAgICAgICAg
ICAgIHwgICAgMyArCiByaXNjdi8uZ2l0aWdub3JlICAgICAgICB8ICAgIDEgKwogMTAgZmlsZXMg
Y2hhbmdlZCwgMTMwMSBpbnNlcnRpb25zKCspLCAxMyBkZWxldGlvbnMoLSkKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCByaXNjdi9zYmktYXNtLW9mZnNldHMuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IHJpc2N2
L3NiaS1zc2UuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IHJpc2N2Ly5naXRpZ25vcmUKCi0tIAoyLjQ3
LjEKCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNj
dgo=
