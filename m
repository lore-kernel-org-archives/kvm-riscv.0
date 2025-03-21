Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB1EEC36002
	for <kvm-riscv@archiver.kernel.org>; Fri, 21 Mar 2025 20:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5bCqMLW67HOevDrBgwjS3F2fot+Ix65eX4CZqOIs2Cg=; b=BsETBShMsWYn45
	L5E4dSbGiAOvtElnvSzwcok7GLRht4w7hqW5FNwaXnjXJUj6mC/eBP8bLZfesktzjgG4xQyIwgYcQ
	dJBXdQji2LWcnT+oZKKzPixFvUoS6N5tY8J/CwCAdQujnihRghJw5VPvjP6qYa9R0duxYkrMuFA5m
	O5FrOSA5TG0UaTOI4j9bwFzUQeCAmeu1gCw6jcCLv/H7G3Iet2OW7sS+h+htvwtr83yW7FHUoW7gf
	Tki81rGtZuKjliLgMFgLOipOndk5UsmegDMmRlyZMoS8rdkVqK+QYhquZhmGG8LlUOrQmxGoZtmvO
	SQKOg18ZPF4ZmBDZbd7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tviz5-0000000GAP5-0y5S;
	Fri, 21 Mar 2025 20:28:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvio1-0000000G8yh-354Q
	for kvm-riscv@bombadil.infradead.org;
	Fri, 21 Mar 2025 20:17:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=R7BG31Q6vK9JpMaOa+K6RrvHXqX/LMxE0XAVM9lzVKM=; b=NSm0DXRTi3b+Cp/U2wOCHrlfd9
	/b9IcuZ5m0AMkVag7SsJu6CwiQyeiHn1WMLydsXWNyxKDazns9otzo9xYlQXwkdSQx1yGgEUr6sJt
	6Hu00wbloam0M+C0VU9ooTuKpjM5XFT9dfPcoIoY7wCdbAKsjdjZITmgmZvfCErNLaZYFLhywpugb
	cFNFoZEqrkVHZCaY5/UFZLaH4TUl6zoRARym3ysIOuQyQqzI9CWeYz8rq7c6c3N6eF1L5IFK2Oq6x
	9d70US+jA2PNneakJnQd6LecGTINr773Mp02EuOq9p7N9oP1zb72H577SUZHj+PmXg4p+gXqkE+Uu
	3ZrO6naw==;
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvinw-00000004WmY-1pqM
	for kvm-riscv@lists.infradead.org;
	Fri, 21 Mar 2025 20:17:22 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso21260695e9.1
        for <kvm-riscv@lists.infradead.org>; Fri, 21 Mar 2025 13:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1742588237; x=1743193037; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R7BG31Q6vK9JpMaOa+K6RrvHXqX/LMxE0XAVM9lzVKM=;
        b=PohSdCevJvmvKQB+DNQzptJ8x7unxKC/XcfIDkOmHvSgKUDJqA7hrC8kiU6o6wEqvO
         Zp4LWPOsotW6rTXi242t/Wc4o8z5P+BE4cMCDry2peeNx+JyOg442Jc1zgTPIGZCeWbK
         QP4h2l1nd4KPQZ3eMRvL5HAgMLGJg4rTJg+5u9frEt2oyxIGWMiLzbVW9YWuTiMq5jRQ
         8vTenyaDgGijN4UXiKIE1NVmhsKW49Bm5D9Z/Q6/PNbp5u1wgc0VRGjfajNBQAzH4iqH
         s602GSZjdXtmvKHPSCmZPf9qrFe5iwpM0trzf5m5guTUnjhiJ/lMtVCKJAULZ6WOXbor
         qjlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742588237; x=1743193037;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R7BG31Q6vK9JpMaOa+K6RrvHXqX/LMxE0XAVM9lzVKM=;
        b=ZkhEQ/Yz5kYJfOsXjxQIiK06NNRHVYTyotoGuJGdR6am+cLd9bfB0ClaTYdebFFkE1
         RpTjUwSlHzjTUoUrQz35h6eBqxWRA4WZakc4OfmypAD6GLTVsgAQ/xzTNnY6N4GddQpt
         g11wQ0U+MlebgtJMV6fJ7kDn4kl0/b/1h3btQ4E8PPLabhoSw3VpUY/XDEGuZK+vZVwS
         +LgWwTBTe8S0ChkLJnXWjbLutyYeeq4Av0EnwM5L6lTRAUsOSZrJw5O7hnKb79yiX89/
         s/TSrQb/qYFmNzyErxHau+PTbjTr93O24dgtKqwwjOEeD/nOIYoIWDy2B6CNKeQPP3k8
         T05A==
X-Forwarded-Encrypted: i=1; AJvYcCXTUsu/Z2oE8NGhwMDPvnOP+oe67gaexXgs3mu5nOYhvX+9WRBbYOebmgGUXtyGdPxMk39+Ew+isW0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwJwAIwRBDmNKRpewsI4S0jvkq60CPn6m2wH/56aupP+iCNipVo
	F5EyXwrbzTNiqnE+J0CLSDCC3gFG8n0CB3FccEuPiEnsGL9Xq4nN0+sI0SJauXc=
X-Gm-Gg: ASbGncvVp4YYG5IMrP7F3AFMUXXOkGvf2siC+AxGSqkQ+8KX/Mf0pp3NLRzVMLzPk5x
	+hdOL7Ali0RxVgLkNn+5W0oErAKhV6vgmgtn8tU1kixYo+KnD/ElQATfBxufrIrM4sbOSlDOLro
	aCa/3qEGCqIIZweIlmXjC/M6ZahPOzdPScij8wjilAsc17aI/62NR9bU75JhVAoRjv4Q6ZdB2Li
	3ZBB0YAOKqgMo0uF/aPgaa8RbG51jDCXluj5pBY+uT/nT7ywiHsRbEK20FKbbyaW7NpCzCfBhRq
	0UNSb7XpGBW8yz/i3oGR4NqgSXx+lTxSuTZ+bSbD+cqOty8QN0PLqnZV9ul3mRb/QWfB0PTCG2n
	28mSYf8WXWVha4A==
X-Google-Smtp-Source: AGHT+IG8ZxwPRkOblN342dvVLmBvhNmNS0L0D6XmV0x3o0uuBTTX6peyNiLq+Uw+JiQU4iJC6NDGSw==
X-Received: by 2002:a05:600c:4695:b0:43c:f75a:eb54 with SMTP id 5b1f17b1804b1-43d50a0a023mr43505215e9.13.1742588237049;
        Fri, 21 Mar 2025 13:17:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f995778sm3302127f8f.11.2025.03.21.13.17.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 13:17:16 -0700 (PDT)
Message-ID: <1f900b99-e260-42cc-9e5d-ea4e7a4365ec@rivosinc.com>
Date: Fri, 21 Mar 2025 21:17:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH 2/3] riscv: sbi: Add kfail versions of
 sbiret_report functions
To: Andrew Jones <andrew.jones@linux.dev>, kvm-riscv@lists.infradead.org,
 kvm@vger.kernel.org
Cc: atishp@rivosinc.com, akshaybehl231@gmail.com
References: <20250321165403.57859-5-andrew.jones@linux.dev>
 <20250321165403.57859-7-andrew.jones@linux.dev>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250321165403.57859-7-andrew.jones@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_201720_814751_F3926472 
X-CRM114-Status: GOOD (  12.52  )
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

CgpPbiAyMS8wMy8yMDI1IDE3OjU0LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gcmVwb3J0X2tmYWls
IGlzIHVzZWZ1bCBmb3IgU0JJIHRlc3RpbmcgdG8gYWxsb3dpbmcgQ0kgdG8gUEFTUyBldmVuCj4g
d2hlbiBTQkkgaW1wbGVtZW50YXRpb25zIGhhdmUga25vd24gZmFpbHVyZXMuIFNpbmNlIHNiaXJl
dF9yZXBvcnQKPiBmdW5jdGlvbnMgYXJlIGZyZXF1ZW50bHkgdXNlZCBieSBTQkkgdGVzdHMsIG1h
a2Uga2ZhaWwgdmVyc2lvbnMgb2YKPiB0aGVtIHRvby4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRy
ZXcgSm9uZXMgPGFuZHJldy5qb25lc0BsaW51eC5kZXY+Cj4gLS0tCj4gIHJpc2N2L3NiaS10ZXN0
cy5oIHwgMjAgKysrKysrKysrKysrKysrLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDE1IGluc2Vy
dGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3Jpc2N2L3NiaS10ZXN0
cy5oIGIvcmlzY3Yvc2JpLXRlc3RzLmgKPiBpbmRleCBkZGZhZDdmZWYyOTMuLmQ1YzRhZTcwOTYz
MiAxMDA2NDQKPiAtLS0gYS9yaXNjdi9zYmktdGVzdHMuaAo+ICsrKyBiL3Jpc2N2L3NiaS10ZXN0
cy5oCj4gQEAgLTM5LDcgKzM5LDggQEAKPiAgI2luY2x1ZGUgPGxpYmNmbGF0Lmg+Cj4gICNpbmNs
dWRlIDxhc20vc2JpLmg+Cj4gIAo+IC0jZGVmaW5lIF9fc2JpcmV0X3JlcG9ydChyZXQsIGV4cGVj
dGVkX2Vycm9yLCBleHBlY3RlZF92YWx1ZSwgaGFzX3ZhbHVlLCBleHBlY3RlZF9lcnJvcl9uYW1l
LCBmbXQsIC4uLikgKHsJXAo+ICsjZGVmaW5lIF9fc2JpcmV0X3JlcG9ydChrZmFpbCwgcmV0LCBl
eHBlY3RlZF9lcnJvciwgZXhwZWN0ZWRfdmFsdWUsCQkJCQkJXAo+ICsJCQloYXNfdmFsdWUsIGV4
cGVjdGVkX2Vycm9yX25hbWUsIGZtdCwgLi4uKSAoewkJCQkJCVwKPiAgCWxvbmcgZXhfZXJyID0g
ZXhwZWN0ZWRfZXJyb3I7CQkJCQkJCQkJCVwKPiAgCWxvbmcgZXhfdmFsID0gZXhwZWN0ZWRfdmFs
dWU7CQkJCQkJCQkJCVwKPiAgCWJvb2wgaGFzX3ZhbCA9ICEhKGhhc192YWx1ZSk7CQkJCQkJCQkJ
CVwKPiBAQCAtNDgsOSArNDksOSBAQAo+ICAJYm9vbCBwYXNzOwkJCQkJCQkJCQkJCVwKPiAgCQkJ
CQkJCQkJCQkJCQlcCj4gIAlpZiAoaGFzX3ZhbCkJCQkJCQkJCQkJCQlcCj4gLQkJcGFzcyA9IHJl
cG9ydChjaF9lcnIgJiYgY2hfdmFsLCBmbXQsICMjX19WQV9BUkdTX18pOwkJCQkJCVwKPiArCQlw
YXNzID0gcmVwb3J0X2tmYWlsKGtmYWlsLCBjaF9lcnIgJiYgY2hfdmFsLCBmbXQsICMjX19WQV9B
UkdTX18pOwkJCQlcCj4gIAllbHNlCQkJCQkJCQkJCQkJCVwKPiAtCQlwYXNzID0gcmVwb3J0KGNo
X2VyciwgZm10ICI6ICVzIiwgIyNfX1ZBX0FSR1NfXywgZXhwZWN0ZWRfZXJyb3JfbmFtZSk7CQkJ
CVwKPiArCQlwYXNzID0gcmVwb3J0X2tmYWlsKGtmYWlsLCBjaF9lcnIsIGZtdCAiOiAlcyIsICMj
X19WQV9BUkdTX18sIGV4cGVjdGVkX2Vycm9yX25hbWUpOwkJXAo+ICAJCQkJCQkJCQkJCQkJCVwK
PiAgCWlmICghcGFzcyAmJiBoYXNfdmFsKQkJCQkJCQkJCQkJXAo+ICAJCXJlcG9ydF9pbmZvKGZt
dCAiOiBleHBlY3RlZCAoZXJyb3I6ICVsZCwgdmFsdWU6ICVsZCksIHJlY2VpdmVkOiAoZXJyb3I6
ICVsZCwgdmFsdWUgJWxkKSIsCVwKPiBAQCAtNjMsMTQgKzY0LDIzIEBACj4gIH0pCj4gIAo+ICAj
ZGVmaW5lIHNiaXJldF9yZXBvcnQocmV0LCBleHBlY3RlZF9lcnJvciwgZXhwZWN0ZWRfdmFsdWUs
IC4uLikgXAo+IC0JX19zYmlyZXRfcmVwb3J0KHJldCwgZXhwZWN0ZWRfZXJyb3IsIGV4cGVjdGVk
X3ZhbHVlLCB0cnVlLCAjZXhwZWN0ZWRfZXJyb3IsIF9fVkFfQVJHU19fKQo+ICsJX19zYmlyZXRf
cmVwb3J0KGZhbHNlLCByZXQsIGV4cGVjdGVkX2Vycm9yLCBleHBlY3RlZF92YWx1ZSwgdHJ1ZSwg
I2V4cGVjdGVkX2Vycm9yLCBfX1ZBX0FSR1NfXykKPiAgCj4gICNkZWZpbmUgc2JpcmV0X3JlcG9y
dF9lcnJvcihyZXQsIGV4cGVjdGVkX2Vycm9yLCAuLi4pIFwKPiAtCV9fc2JpcmV0X3JlcG9ydChy
ZXQsIGV4cGVjdGVkX2Vycm9yLCAwLCBmYWxzZSwgI2V4cGVjdGVkX2Vycm9yLCBfX1ZBX0FSR1Nf
XykKPiArCV9fc2JpcmV0X3JlcG9ydChmYWxzZSwgcmV0LCBleHBlY3RlZF9lcnJvciwgMCwgZmFs
c2UsICNleHBlY3RlZF9lcnJvciwgX19WQV9BUkdTX18pCj4gIAo+ICAjZGVmaW5lIHNiaXJldF9j
aGVjayhyZXQsIGV4cGVjdGVkX2Vycm9yLCBleHBlY3RlZF92YWx1ZSkgXAo+ICAJc2JpcmV0X3Jl
cG9ydChyZXQsIGV4cGVjdGVkX2Vycm9yLCBleHBlY3RlZF92YWx1ZSwgImNoZWNrIHNiaS5lcnJv
ciBhbmQgc2JpLnZhbHVlIikKPiAgCj4gKyNkZWZpbmUgc2JpcmV0X2tmYWlsKGtmYWlsLCByZXQs
IGV4cGVjdGVkX2Vycm9yLCBleHBlY3RlZF92YWx1ZSwgLi4uKSBcCj4gKwlfX3NiaXJldF9yZXBv
cnQoa2ZhaWwsIHJldCwgZXhwZWN0ZWRfZXJyb3IsIGV4cGVjdGVkX3ZhbHVlLCB0cnVlLCAjZXhw
ZWN0ZWRfZXJyb3IsIF9fVkFfQVJHU19fKQo+ICsKPiArI2RlZmluZSBzYmlyZXRfa2ZhaWxfZXJy
b3Ioa2ZhaWwsIHJldCwgZXhwZWN0ZWRfZXJyb3IsIC4uLikgXAo+ICsJX19zYmlyZXRfcmVwb3J0
KGtmYWlsLCByZXQsIGV4cGVjdGVkX2Vycm9yLCAwLCBmYWxzZSwgI2V4cGVjdGVkX2Vycm9yLCBf
X1ZBX0FSR1NfXykKPiArCj4gKyNkZWZpbmUgc2JpcmV0X2NoZWNrX2tmYWlsKGtmYWlsLCByZXQs
IGV4cGVjdGVkX2Vycm9yLCBleHBlY3RlZF92YWx1ZSkgXAo+ICsJc2JpcmV0X2tmYWlsKGtmYWls
LCByZXQsIGV4cGVjdGVkX2Vycm9yLCBleHBlY3RlZF92YWx1ZSwgImNoZWNrIHNiaS5lcnJvciBh
bmQgc2JpLnZhbHVlIikKPiArCj4gIHN0YXRpYyBpbmxpbmUgYm9vbCBlbnZfb3Jfc2tpcChjb25z
dCBjaGFyICplbnYpCj4gIHsKPiAgCWlmICghZ2V0ZW52KGVudikpIHsKCkhpIEFuZHJldywKCkkg
bmVlZGVkIHRoYXQgYXMgd2VsbCBpbiBhbm90aGVyIHRlc3Qgc286CgpSZXZpZXdlZC1ieTogQ2zD
qW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2b3NpbmMuY29tPgoKVGhhbmtzLAoKQ2zDqW1lbnQKCi0t
IAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
