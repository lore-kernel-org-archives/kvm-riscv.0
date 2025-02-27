Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB1DC19F2E
	for <kvm-riscv@archiver.kernel.org>; Thu, 27 Feb 2025 14:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ektveff3tmKd+eRfAuJEmZXtxAz66CmAmhQIhLbWh2A=; b=2KU5yQM01FViV4
	zhfbOJOpqnYNG5gQ0QT1n70FOMMAgnbeH4BemFH7vkXnwEgoA4rkXbr/8hlQRuNHTW1y5dhy3u+9z
	Rt4TGXXQDoUDKNEqOreV7q2lWcqszlGERbqmIXHJ3efDaWFMusmJxPkVk/tYBothagL3NSmUvZgg+
	WtUyQ33qdeXGWqxemlvOFTDs2+9tjdQThLwQHD221yQhBu7GXm1HKLcVDt1bUefg2ACOSiskIvkDu
	TzMgsfMXB1rcajj3dSd1a+Zl+Kqyy60LcRRSQUT/VFPNf0a2N0OWbMK1hF2V0Hmmj4uAluDkTyKxK
	Ch7PJgNgTYgO4fijvdfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnf6e-00000007nMs-3dno;
	Thu, 27 Feb 2025 14:43:20 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnelN-00000007heh-3pW7
	for kvm-riscv@lists.infradead.org;
	Thu, 27 Feb 2025 14:21:23 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2235908a30aso12582745ad.3
        for <kvm-riscv@lists.infradead.org>; Thu, 27 Feb 2025 06:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1740666081; x=1741270881; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zcRhQci/RXWGGsMZb4UKh+akmDB//s8pm1yqRx0zAGc=;
        b=Vg4yh9rMgW1qbbfyNMIqritlXj/1KJ8GQVuJI3DkbvuQcPny+2PrwyHutndMhcTrwa
         95VKS/U+JRTHoudWLsIyMZWuaqLShcGuIWAJFoXuUxgw940yYsK9oh0D4TbQdvGy9aVU
         01C4YzmeKR1si554XIo5sQRvB/7JIAY9tzxdM0cjx8IxA5lmJIYgn1ozR1PpYNkAJVDv
         Yxvd9LMORbhZHUbmofy+3rQUA8v0tk1R+NyroHhE7ItrfLJcQtbjJAUmtPU2EZkMpYFJ
         cPb6ZTTdIvKi3T4+cloXZJhL3UnvIbQMIH1fkyMjLi+ixUKyGKpKdR2rRp5YSRwhnKhO
         vb4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740666081; x=1741270881;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zcRhQci/RXWGGsMZb4UKh+akmDB//s8pm1yqRx0zAGc=;
        b=H5WC6ZdWsLKTXNrJSEM/NC4S0tlq6jb8orpuMf5POUbpWtPcTJIY/rgpE0JC62QQMl
         xx/5+hWcQJ4HvNGcEnVVE+i4SxuVe8/K1KIqXYnhuD7Zh2FXN6+7PPAIXEQjafwTM1pL
         xrtmswXpr0/GIAfORKRiFAWn+S/SUd1Y/1h9Vss1ZkO+hQN9+wVdfhWx+WCtMXlR8urk
         Skzz5BhWA9SlhOjaR2C4nGeo4Gdn9YNYA2t1aqtoCYIT+43AKrHeT1ur3iphyDSNK++m
         hsZGfZNtrHpKmxKyK3YoNNCu2oOHy3zOlvwh9vgfeyE8FHlNIXe03Do3c2r3v5jSiE03
         lPZA==
X-Forwarded-Encrypted: i=1; AJvYcCXiEfgvcype4932FWudccHlD1q/HSgfT5dszWo+Y4+wd3ZkioiewIxTd/aNB0Cf0JE34rCk5mkY2uU=@lists.infradead.org
X-Gm-Message-State: AOJu0YzqdL8+X4BRIOkMO/eCnjmRjG8mlsI711XzMHZY77JOXpyNIMYA
	0ZpqoBnfraQIsOxOvwIcKB4aie9xYUBm5Z/wZ4W507FE43k4UOq1zRhTygHESuU=
X-Gm-Gg: ASbGncuRzACx8ohh6/2qNHxObGl+bKjXWx2q4iQ/GZzowKq8q2XLmrggEbUlElr3Eyb
	QPeHxdaI6gH1qPiDLpoqxvskeVHsGHeuj21oimXN/nv9O4vEqYrT340GGvkERohtYDay0XDPD/V
	GajImIQ/hVmerd4V8gClW9kKnuynm+S3TPZPiyxF4ngKshQaw+X6il8jxgM6YQ62nCf1kpneF+b
	nPwmvHQg83ClX1jvAo3MzBHoF1ASZNgCAsej3/Rmzih3I+Sf7Cmi8+umH4uSi5GKPV0BgZOT8ya
	1T/L/OIfb+6URNrv3d60i9p+qC2zNonYoQE4Viw0Uk2WsaDWSCOIXX9OES4hsOX9GfA01tU=
X-Google-Smtp-Source: AGHT+IFdEk0YPDQ8/BU4kljbr21li5JWanhTidXvkPSep5iNGjLQcAtBNxEtg0eXVvycxUwM+etDJg==
X-Received: by 2002:a17:902:c40d:b0:21f:8677:5961 with SMTP id d9443c01a7336-223201f7dc8mr106609565ad.34.1740666081230;
        Thu, 27 Feb 2025 06:21:21 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223504e4f64sm14851785ad.186.2025.02.27.06.21.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 06:21:20 -0800 (PST)
Message-ID: <8616da9c-9fa7-4555-ab46-85380f548fa6@rivosinc.com>
Date: Thu, 27 Feb 2025 15:21:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v2 01/11] riscv: sbi: Drop fwft upper bits
 test
To: Andrew Jones <andrew.jones@linux.dev>, kvm-riscv@lists.infradead.org
Cc: atishp@rivosinc.com, jamestiotio@gmail.com
References: <20250227141946.91604-13-andrew.jones@linux.dev>
 <20250227141946.91604-14-andrew.jones@linux.dev>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250227141946.91604-14-andrew.jones@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_062122_100886_A539899A 
X-CRM114-Status: GOOD (  14.46  )
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

CgpPbiAyNy8wMi8yMDI1IDE1OjE5LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gVGhlIHRlc3Qgc2hv
dWxkIGJlIGNoZWNraW5nIGZvciBTQklfU1VDQ0VTUyBhbmQgdGhhdCB0aGUgYmVoYXZpb3Igb2YK
PiBmZWF0dXJlID0gQklUKDMyKSBpcyB0aGUgc2FtZSBhcyBmZWF0dXJlID0gMCAoTUlTQUxJR05F
RF9FWENfREVMRUcpLgo+IEhvd2V2ZXIsIGVuYWJsaW5nIE1JU0FMSUdORURfRVhDX0RFTEVHIGRv
ZXNuJ3QgYWx3YXlzIGxlYWQgdG8gdHJhcHMKPiBpbiBTLW1vZGUgKHRoZSBwbGF0Zm9ybSBtYXkg
c3VwcG9ydCBtaXNhbGlnbmVkIGFjY2Vzc2VzIGFuZCBub3QKPiB0cmFwIGF0IGFsbCkuIERyb3Ag
dGhpcyB1cHBlciBiaXRzIG9mIGZlYXR1cmUgSUQgdGVzdCBmb3Igbm93Lgo+IFdlJ2xsIGFkZCBp
dCBiYWNrIHdpdGggYW5vdGhlciBmZWF0dXJlIHRoYXQgaGFzIGEgZGV0ZXJtaW5pc3RpYwo+IGJl
aGF2aW9yIChzdWNoIGFzIHdpdGggdGhlIEFEVUUgZmVhdHVyZSkuCj4gCj4gU2lnbmVkLW9mZi1i
eTogQW5kcmV3IEpvbmVzIDxhbmRyZXcuam9uZXNAbGludXguZGV2Pgo+IC0tLQo+ICByaXNjdi9z
YmktZndmdC5jIHwgMTUgLS0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNSBkZWxl
dGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcmlzY3Yvc2JpLWZ3ZnQuYyBiL3Jpc2N2L3NiaS1m
d2Z0LmMKPiBpbmRleCBmNzNhZTUyZTczOTcuLmYzNDA4ZDhkZTA4MSAxMDA2NDQKPiAtLS0gYS9y
aXNjdi9zYmktZndmdC5jCj4gKysrIGIvcmlzY3Yvc2JpLWZ3ZnQuYwo+IEBAIC01NywyMSArNTcs
NiBAQCBzdGF0aWMgdm9pZCBmd2Z0X2NoZWNrX2Jhc2Uodm9pZCkKPiAgCWZ3ZnRfY2hlY2tfcmVz
ZXJ2ZWQoU0JJX0ZXRlRfR0xPQkFMX1JFU0VSVkVEX1NUQVJUKTsKPiAgCWZ3ZnRfY2hlY2tfcmVz
ZXJ2ZWQoU0JJX0ZXRlRfR0xPQkFMX1JFU0VSVkVEX0VORCk7Cj4gIAo+IC0jaWYgX19yaXNjdl94
bGVuID4gMzIKPiAtCS8qIENoZWNrIGlkID4gMzIgYml0cyAqLwo+IC0Jewo+IC0JCXN0cnVjdCBz
YmlyZXQgcmV0Owo+IC0KPiAtCQlyZXQgPSBmd2Z0X2dldF9yYXcoQklUKDMyKSk7Cj4gLQkJc2Jp
cmV0X3JlcG9ydF9lcnJvcigmcmV0LCBTQklfRVJSX0lOVkFMSURfUEFSQU0sCj4gLQkJCQkgICAg
ImdldCBmZWF0dXJlIHdpdGggYml0IDMyIHNldCBlcnJvciIpOwo+IC0KPiAtCQlyZXQgPSBmd2Z0
X3NldF9yYXcoQklUKDMyKSwgMCwgMCk7Cj4gLQkJc2JpcmV0X3JlcG9ydF9lcnJvcigmcmV0LCBT
QklfRVJSX0lOVkFMSURfUEFSQU0sCj4gLQkJCQkgICAgInNldCBmZWF0dXJlIHdpdGggYml0IDMy
IHNldCBlcnJvciIpOwo+IC0JfQo+IC0jZW5kaWYKPiAtCj4gIAlyZXBvcnRfcHJlZml4X3BvcCgp
Owo+ICB9Cj4gIAoKSGkgQW5kcmV3LAoKTG9va3MgZ29vZCB0byBtZS4KClJldmlld2VkLWJ5OiBD
bMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+CgpUaGFua3MsCgpDbMOpbWVudAoK
Ci0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
