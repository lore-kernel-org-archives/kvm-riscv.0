Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B14B2C021BB
	for <kvm-riscv@archiver.kernel.org>; Mon, 24 Feb 2025 16:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GBnjz0qE0PLgIIoVkZGYe0dC5AVEPfH2UXJvF0NoK7g=; b=e1XmvPkNI233cr
	qkZhPHUba/700KMiqMXQcJ0HE8cFWOTn0UjymBqbdOHKow/5kyq7mZVAhd4/X4p20PbVpetarLAj1
	2juu5zwcR9Vbzj2R5VR2QTWQCxWU3awhtmh8IpyNAXMD+p07BvtYtdF/bqkK3mJ2KUGblCJDYWH/T
	wfxFjbbWSkCd8ae5widjmdu947PTo0DAW4oh7hL5KXr6g5HFbOcCQ43D9uNn5DgfdmvfdpIRMMC0x
	zEdJzsdMhcjTdxn0K0Xm0IY8iW4+YtlOZkj5i2U+X0nKKWSYg0HhciRsoREJ5DLF7dan7qX0F1QgX
	4z0LeuHqzfgjJ03EaFxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmbmT-0000000EWQK-1g5t;
	Mon, 24 Feb 2025 16:58:09 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmbiQ-0000000EVEG-3jkx
	for kvm-riscv@lists.infradead.org;
	Mon, 24 Feb 2025 16:54:00 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-220d601886fso69666445ad.1
        for <kvm-riscv@lists.infradead.org>; Mon, 24 Feb 2025 08:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1740416038; x=1741020838; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QrYWA9zd+DcMhLEBuvcbb8MzbMDaNABrj0CnIqtMRzc=;
        b=CWCLPDDwbGRc1A7zxWYKIGy0dmSFU6GJ8yIc1que0KSl7Yx9iVqszv6LLw/Df4bo62
         kaivwWIBxoTHnYGWpAktBv/wntORmkcHmavoiiFcNLxlx55EzBoWARFhYZF4FYGU1UkD
         xKNMAPZoubaIUP1VcyyIg/Y/NKt+T5a4b8h4KHqgiwMLlIJa5nE507pSCywhhU/cfRuU
         iWyGwi/vbhH/+LSOhM/TSABdUph3r8RabzjLbT0taP5QHw5qSXKm3ldyxGhVa0Z2K8jH
         DzKfGCY/A8FK9PtJUV0R0q/pMSqolRs2pziPqG5Rws745jdl7QUqkBdZ68LzbjGApyiQ
         GDUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740416038; x=1741020838;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QrYWA9zd+DcMhLEBuvcbb8MzbMDaNABrj0CnIqtMRzc=;
        b=ZH5yUV+tf6VCQsC8o7b5GhPTggBSIHhMLuomVmi9rl2smszsp/My+LOb8mzYkGjr1e
         Fde5ugWBJShjxKi7fFM8UmdLwWL7+bTxe0PLgFbOxphlevlyzjOltRTVqqKMbMaRaahp
         rWJixFk3IGIGI90Mu98yAmeHtU/QiED208wD9huq5zr5gx91sTPztiq0AOBw2auRs01R
         GvIYWHayrAirmzeqMzJIEHs4NuIoNGJsvmZ0vjspCTpx8NweKsVemaIV3w7RtEopsETB
         6hiy3lD+dhK05DCoWGQORw5DRVYkKDftgVuT2eUNSREn+jEXXntW+UoYDKN6R5Xr1n3P
         /0Jg==
X-Forwarded-Encrypted: i=1; AJvYcCV1r4ty2HxKjTevT2rnkRJw6fHzzGC2lKLRTETyWjACWfl9RfkjWeIoRjv7hMir44l9pWsiyTRlwNM=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzj8csi+4eCwoUddjcpaiME9ALUmu8+zai4W8p6+ESJRgsrSvPN
	WqBzs1hibDjvfV4hX8xL5vAzjhc5BoSiQ6JCKBM3rcTr9fwRuMbV8dnc15ii498=
X-Gm-Gg: ASbGncvs66dAbjlHWmuj4WvERVBoEAY0XMvzJ7awHAFDhjWBwtOar7rz5U4xJgYp2Aa
	Dpa+Az5NNawMDM8mDi71hZzgZthmVwodFOY2oW9WyhgTRxhyfsbYnuPJ2KdxJz1RHjk1V9gxl7P
	Z0hMqnsC/EcrS2rkaiVld/BSsXdHLcWW+c5GjoH4N49ESyFGchQ/AWXMZ3yBZcku/MHSGJl9rzx
	rE9BSLUMTUvtdogo4nLK+rsFNS1UJKEFTjwRW7gYSFMg9nMuDlOwoCxZS3+sBTQzcYQxzr9X3KJ
	UuE9P5l2Nfc2u0f0Zn82hj/35pC/ponifljvpNp2mregPNqcp5nvKccMu/j9JAymn9Vo3lc=
X-Google-Smtp-Source: AGHT+IG1Po2UxU95piYmB78PE3WTog/Ynkx+0A2HK26IBgaObsjXi/0Svj3pEx5YqhS8aEGXk6rZJg==
X-Received: by 2002:a17:902:e846:b0:21f:6c3:aefb with SMTP id d9443c01a7336-2219ffa368dmr253680835ad.35.1740416037899;
        Mon, 24 Feb 2025 08:53:57 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22105174c73sm150764455ad.216.2025.02.24.08.53.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 08:53:57 -0800 (PST)
Message-ID: <0841711d-3a5a-4d39-999d-5b45ebe61d11@rivosinc.com>
Date: Mon, 24 Feb 2025 17:53:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH 01/10] riscv: sbi: Mark known fwft failures
 as kfails
To: Andrew Jones <andrew.jones@linux.dev>, kvm-riscv@lists.infradead.org
Cc: atishp@rivosinc.com, jamestiotio@gmail.com
References: <20250221155533.123418-12-andrew.jones@linux.dev>
 <20250221155533.123418-13-andrew.jones@linux.dev>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250221155533.123418-13-andrew.jones@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_085359_186297_B5EC3A23 
X-CRM114-Status: GOOD (  12.06  )
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

CgpPbiAyMS8wMi8yMDI1IDE2OjU1LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gVW50aWwgd2UgZml4
IG9wZW5zYmkgbWFyayB0aGVzZSBrbm93biBmYWlsdXJlcyBhcyBrZmFpbHMgc28gd2UgY2FuCj4g
cGFzcyBDSS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgSm9uZXMgPGFuZHJldy5qb25lc0Bs
aW51eC5kZXY+Cj4gLS0tCj4gIHJpc2N2L3NiaS1md2Z0LmMgfCAxNSArKysrKysrKysrKystLS0K
PiAgMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL3Jpc2N2L3NiaS1md2Z0LmMgYi9yaXNjdi9zYmktZndmdC5jCj4gaW5kZXgg
YjEwYzE0N2YyMmRkLi4xOTM0MGQ2YmI0OGMgMTAwNjQ0Cj4gLS0tIGEvcmlzY3Yvc2JpLWZ3ZnQu
Ywo+ICsrKyBiL3Jpc2N2L3NiaS1md2Z0LmMKPiBAQCAtNjMsMTEgKzYzLDE3IEBAIHN0YXRpYyB2
b2lkIGZ3ZnRfY2hlY2tfYmFzZSh2b2lkKQo+ICAJCXN0cnVjdCBzYmlyZXQgcmV0Owo+ICAKPiAg
CQlyZXQgPSBmd2Z0X2dldF9yYXcoQklUKDMyKSk7Cj4gLQkJc2JpcmV0X3JlcG9ydF9lcnJvcigm
cmV0LCBTQklfRVJSX0lOVkFMSURfUEFSQU0sCj4gKwkJaWYgKHJldC5lcnJvciA9PSAwKQo+ICsJ
CQlyZXBvcnRfa2ZhaWwodHJ1ZSwgZmFsc2UsICJnZXQgZmVhdHVyZSB3aXRoIGJpdCAzMiBzZXQg
ZXJyb3I6IFNCSV9FUlJfSU5WQUxJRF9QQVJBTSIpOwo+ICsJCWVsc2UKPiArCQkJc2JpcmV0X3Jl
cG9ydF9lcnJvcigmcmV0LCBTQklfRVJSX0lOVkFMSURfUEFSQU0sCj4gIAkJCQkgICAgImdldCBm
ZWF0dXJlIHdpdGggYml0IDMyIHNldCBlcnJvciIpOwo+ICAKPiAgCQlyZXQgPSBmd2Z0X3NldF9y
YXcoQklUKDMyKSwgMCwgMCk7Cj4gLQkJc2JpcmV0X3JlcG9ydF9lcnJvcigmcmV0LCBTQklfRVJS
X0lOVkFMSURfUEFSQU0sCj4gKwkJaWYgKHJldC5lcnJvciA9PSAwKQo+ICsJCQlyZXBvcnRfa2Zh
aWwodHJ1ZSwgZmFsc2UsICJzZXQgZmVhdHVyZSB3aXRoIGJpdCAzMiBzZXQgZXJyb3I6IFNCSV9F
UlJfSU5WQUxJRF9QQVJBTSIpOwo+ICsJCWVsc2UKPiArCQkJc2JpcmV0X3JlcG9ydF9lcnJvcigm
cmV0LCBTQklfRVJSX0lOVkFMSURfUEFSQU0sCj4gIAkJCQkgICAgInNldCBmZWF0dXJlIHdpdGgg
Yml0IDMyIHNldCBlcnJvciIpOwo+ICAJfQo+ICAjZW5kaWYKPiBAQCAtMTY3LDcgKzE3MywxMCBA
QCBzdGF0aWMgdm9pZCBmd2Z0X2NoZWNrX21pc2FsaWduZWRfZXhjX2RlbGVnKHZvaWQpCj4gIAly
ZXQgPSBmd2Z0X21pc2FsaWduZWRfZXhjX3NldCgwLCBTQklfRldGVF9TRVRfRkxBR19MT0NLKTsK
PiAgCXNiaXJldF9yZXBvcnRfZXJyb3IoJnJldCwgU0JJX1NVQ0NFU1MsICJTZXQgbWlzYWxpZ25l
ZCBkZWxlZyBmZWF0dXJlIHZhbHVlIDAgYW5kIGxvY2siKTsKPiAgCXJldCA9IGZ3ZnRfbWlzYWxp
Z25lZF9leGNfc2V0KDEsIDApOwo+IC0Jc2JpcmV0X3JlcG9ydF9lcnJvcigmcmV0LCBTQklfRVJS
X0xPQ0tFRCwKPiArCWlmIChyZXQuZXJyb3IgPT0gU0JJX0VSUl9ERU5JRUQpCj4gKwkJcmVwb3J0
X2tmYWlsKHRydWUsIGZhbHNlLCAiU2V0IGxvY2tlZCBtaXNhbGlnbmVkIGRlbGVnIGZlYXR1cmUg
dG8gbmV3IHZhbHVlOiBTQklfRVJSX0xPQ0tFRCIpOwo+ICsJZWxzZQo+ICsJCXNiaXJldF9yZXBv
cnRfZXJyb3IoJnJldCwgU0JJX0VSUl9MT0NLRUQsCj4gIAkJCSAgICAiU2V0IGxvY2tlZCBtaXNh
bGlnbmVkIGRlbGVnIGZlYXR1cmUgdG8gbmV3IHZhbHVlIik7Cj4gIAlyZXQgPSBmd2Z0X21pc2Fs
aWduZWRfZXhjX2dldCgpOwo+ICAJc2JpcmV0X3JlcG9ydCgmcmV0LCBTQklfU1VDQ0VTUywgMCwg
IkdldCBtaXNhbGlnbmVkIGRlbGVnIGxvY2tlZCB2YWx1ZSAwIik7CgpIaSBBbmRyZXcsCgpSZXZp
ZXdlZC1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgoKVGhhbmtzLAoK
Q2zDqW1lbnQKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3Zt
LXJpc2N2Cg==
