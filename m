Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2305C35FF1
	for <kvm-riscv@archiver.kernel.org>; Fri, 14 Mar 2025 11:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rqQqP8shu88f7BxChbBVT/LdQQ1jNhkOTgWKINarmEc=; b=lGDVMXcuJLEcJB
	iwz4N5lluzzbylxtO3CFhshKDG0cs5IIqePGxLW4RpCvLnJyeFQ5z1frH1hSEKLW4kZbnTieIA/5P
	QAV2z4QNRyPBIPfzQveekJjpxPy9U7EyEDRvAXKfkj10IgUndig8lMmfYegiPsv0CKIxqhPGJDgGu
	85I9idhSBQowFf3vp+g9zQBv4TOjxMW/EADXAj4sTZmbHeX1L2NumU8cqqua0uSZi4v5a/DpRnNAE
	Y6g7PoyE+VvcGmzbjq+Axf6iiwGtfqOghRqpurKGV+PeNW/g6FvT661uF4zc6/j+enMAn3BSOI/vA
	Bd5dinfQZAobSpY3mO6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt3LW-0000000E1D9-07gI;
	Fri, 14 Mar 2025 11:36:58 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt36V-0000000Dz61-1JcX
	for kvm-riscv@lists.infradead.org;
	Fri, 14 Mar 2025 11:21:29 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-43948021a45so17778255e9.1
        for <kvm-riscv@lists.infradead.org>; Fri, 14 Mar 2025 04:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1741951286; x=1742556086; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=A6XtzYhqUw84uSezb9doRczkUr+a5kXQaPrl1FQvJuA=;
        b=c2dIb5XKJ905mI07O9avDh33FN6bEiJAcomMRSk5GF2ua2hCsp8oxKQtPYmYgmIyp8
         gnpGwIEQvi8D7XgDDNpAGkWsB5PYWd2PacZIf+udp/0cd0h+yiL1uTZ+tvwy8Tw2Hhfe
         4GxSlXnqFnWL1LUa82FMF8SXazW8vg6SEwWFXXVindI+97iMyOn1hZR4nnGQgYe828vh
         PIJA/MD6Apu2YKvIZYxVekm5qo9YI3RPOyvPFHrCS/j9kQdPfBs53V/wMfceBouk/0zc
         BDdPO5alhA15mfT1utEgbD3+V0O5EkKabKAA83K2nKhn87YP4jNqYtYLbFouXqwheJju
         Uebg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741951286; x=1742556086;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A6XtzYhqUw84uSezb9doRczkUr+a5kXQaPrl1FQvJuA=;
        b=Dw/sFIjfpYBYRCby4w/a6P6LwL0DzUF/Wwm+O4lBBvjttxVJCdUekcs3iai9ZiU+mJ
         9JS0qLDwK6GKK5AIBsYnCrI4GLMJaom5PQOXvkvawVrbEgnib2yaC9CIQB8ujB+hqlt1
         7kp+yFZx6NO8fdhlQuSIIO+qcFQKDW5k0OEZOeO+sRzfOHLSTMEufWXPylKRTOv7YVtv
         Nf/K2cJza2KVcROXJg7DW/QeP+pvalJSb47VZQp72mllGdmPXhIY7B8fOsaFlzlB8IAk
         bTefaESkcqbBoxnJg54AyfeqJVlSfY2nv8pSJ9D2tFObaBx8+4aAYX+53U29COvrxXdC
         UUrA==
X-Forwarded-Encrypted: i=1; AJvYcCVoK1KWVvy2meqlvbwjgQ8rmFPYYZmVS8jIT05abgVMy1FnMMDv8MPJ8dbV3NcdzIBCAeExcuB2Azk=@lists.infradead.org
X-Gm-Message-State: AOJu0YxMuZ9ZQm/y1hGt9bmSpsVOEUr8nQJkgxSzhzR7/7Dwo9ggAfHU
	ETNrG13npTpx5cTmr6QPYg8ljzZXHBpM9vhjP94/nc1oAnpeFho/SzxQbANOG1Q=
X-Gm-Gg: ASbGncvJFz/TQexBhiUCv4vm5+YOScUiGBAqVZApSQPOgrMuHX8PZRRovlqCjdCf65S
	VPL6UWFMOoHcJfPTgwpLhf6cy0CgC+4dP/4gHWXgwQcxTvR0hUp2GtDMhBhcGVwiRI/A2PvR0q1
	wMK55BsskGKQ4J2p1o8Jbk0y3/mptJfG5xuSuev1TsKUgUw7AttX5G/TW2pC6BVuorkrAlJbiP6
	or17BLnqVU+HPummoeF34uyq7puUxshQsFAbOj+F++1WGQrqT6iF+jqwrZr6JR0sZucvX1DZF8B
	nSg5/ap+e3OuifdCGxJiI/DpqpmwzpA103IgRfv47fpteFym6BhXKvlqJIUq1fFJx7uvLRh7+7y
	FTAYRVgsD7vOEFQ==
X-Google-Smtp-Source: AGHT+IEYaWqqZpuQnf2ljZyi0dtBkuDfK6pK0aoroD3vMSUCfCqdnElivAtTAt81Xq+zCSEqCysJ0Q==
X-Received: by 2002:a05:600c:190e:b0:43c:f513:9585 with SMTP id 5b1f17b1804b1-43d1ec808ebmr27086195e9.13.1741951285516;
        Fri, 14 Mar 2025 04:21:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d200fac7asm14341405e9.28.2025.03.14.04.21.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Mar 2025 04:21:25 -0700 (PDT)
Message-ID: <c411446b-e161-48fa-a94b-e04c00f62b01@rivosinc.com>
Date: Fri, 14 Mar 2025 12:21:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/17] riscv: sbi: add SBI FWFT extension calls
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-kselftest@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>
References: <20250310151229.2365992-1-cleger@rivosinc.com>
 <20250310151229.2365992-4-cleger@rivosinc.com>
 <20250313-ce439653d16b484dba6a8d3e@orel>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20250313-ce439653d16b484dba6a8d3e@orel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_042127_360657_D83DBCDC 
X-CRM114-Status: GOOD (  16.30  )
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

CgpPbiAxMy8wMy8yMDI1IDEzOjQ0LCBBbmRyZXcgSm9uZXMgd3JvdGU6Cj4gT24gTW9uLCBNYXIg
MTAsIDIwMjUgYXQgMDQ6MTI6MTBQTSArMDEwMCwgQ2zDqW1lbnQgTMOpZ2VyIHdyb3RlOgo+PiBB
ZGQgRldGVCBleHRlbnNpb24gY2FsbHMuIFRoaXMgd2lsbCBiZSByYXRpZmllZCBpbiBTQkkgVjMu
MCBoZW5jZSwgaXQgaXMKPj4gcHJvdmlkZWQgYXMgYSBzZXBhcmF0ZSBjb21taXQgdGhhdCBjYW4g
YmUgbGVmdCBvdXQgaWYgbmVlZGVkLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBMw6ln
ZXIgPGNsZWdlckByaXZvc2luYy5jb20+Cj4+IC0tLQo+PiAgYXJjaC9yaXNjdi9rZXJuZWwvc2Jp
LmMgfCAzMCArKysrKysrKysrKysrKysrKysrKysrKysrKysrLS0KPj4gIDEgZmlsZSBjaGFuZ2Vk
LCAyOCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9rZXJuZWwvc2JpLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zYmkuYwo+PiBpbmRleCAy
NTY5MTBkYjEzMDcuLmFmOGUyMTk5ZTMyZCAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJu
ZWwvc2JpLmMKPj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc2JpLmMKPj4gQEAgLTI5OSw5ICsy
OTksMTkgQEAgc3RhdGljIGludCBfX3NiaV9yZmVuY2VfdjAyKGludCBmaWQsIGNvbnN0IHN0cnVj
dCBjcHVtYXNrICpjcHVfbWFzaywKPj4gIAlyZXR1cm4gMDsKPj4gIH0KPj4gIAo+PiArc3RhdGlj
IGJvb2wgc2JpX2Z3ZnRfc3VwcG9ydGVkOwo+PiArCj4+ICBpbnQgc2JpX2Z3ZnRfZ2V0KHUzMiBm
ZWF0dXJlLCB1bnNpZ25lZCBsb25nICp2YWx1ZSkKPj4gIHsKPj4gLQlyZXR1cm4gLUVPUE5PVFNV
UFA7Cj4+ICsJc3RydWN0IHNiaXJldCByZXQ7Cj4+ICsKPj4gKwlpZiAoIXNiaV9md2Z0X3N1cHBv
cnRlZCkKPj4gKwkJcmV0dXJuIC1FT1BOT1RTVVBQOwo+PiArCj4+ICsJcmV0ID0gc2JpX2VjYWxs
KFNCSV9FWFRfRldGVCwgU0JJX0VYVF9GV0ZUX0dFVCwKPj4gKwkJCWZlYXR1cmUsIDAsIDAsIDAs
IDAsIDApOwo+PiArCj4+ICsJcmV0dXJuIHNiaV9lcnJfbWFwX2xpbnV4X2Vycm5vKHJldC5lcnJv
cik7Cj4+ICB9Cj4+ICAKPj4gIC8qKgo+PiBAQCAtMzE0LDcgKzMyNCwxNSBAQCBpbnQgc2JpX2Z3
ZnRfZ2V0KHUzMiBmZWF0dXJlLCB1bnNpZ25lZCBsb25nICp2YWx1ZSkKPj4gICAqLwo+PiAgaW50
IHNiaV9md2Z0X3NldCh1MzIgZmVhdHVyZSwgdW5zaWduZWQgbG9uZyB2YWx1ZSwgdW5zaWduZWQg
bG9uZyBmbGFncykKPj4gIHsKPj4gLQlyZXR1cm4gLUVPUE5PVFNVUFA7Cj4+ICsJc3RydWN0IHNi
aXJldCByZXQ7Cj4+ICsKPj4gKwlpZiAoIXNiaV9md2Z0X3N1cHBvcnRlZCkKPj4gKwkJcmV0dXJu
IC1FT1BOT1RTVVBQOwo+PiArCj4+ICsJcmV0ID0gc2JpX2VjYWxsKFNCSV9FWFRfRldGVCwgU0JJ
X0VYVF9GV0ZUX1NFVCwKPj4gKwkJCWZlYXR1cmUsIHZhbHVlLCBmbGFncywgMCwgMCwgMCk7Cj4+
ICsKPj4gKwlyZXR1cm4gc2JpX2Vycl9tYXBfbGludXhfZXJybm8ocmV0LmVycm9yKTsKPiAKPiBz
YmlfZXJyX21hcF9saW51eF9lcnJubygpIGRvZXNuJ3Qga25vdyBhYm91dCBTQklfRVJSX0RFTklF
RF9MT0NLRUQuCgpOb3Qgb25seSBpdCBkb2Vzbid0IGtub3dzIGFib3V0IERFTklFRF9MT0NLRUQg
YnV0IGFsc28gYW5vdGhlciBidW5jaCBvZgplcnJvcnMuIEknbGwgYWRkIHRoZW0gaW4gYSBzZXBh
cmF0ZSBjb21taXQuCgo+IAo+PiAgfQo+PiAgCj4+ICBzdHJ1Y3QgZndmdF9zZXRfcmVxIHsKPj4g
QEAgLTM4OSw2ICs0MDcsOSBAQCBzdGF0aWMgaW50IHNiaV9md2Z0X2ZlYXR1cmVfbG9jYWxfc2V0
KHUzMiBmZWF0dXJlLCB1bnNpZ25lZCBsb25nIHZhbHVlLAo+PiAgaW50IHNiaV9md2Z0X2FsbF9j
cHVzX3NldCh1MzIgZmVhdHVyZSwgdW5zaWduZWQgbG9uZyB2YWx1ZSwgdW5zaWduZWQgbG9uZyBm
bGFncywKPj4gIAkJCSAgYm9vbCByZXZlcnRfb25fZmFpbCkKPj4gIHsKPj4gKwlpZiAoIXNiaV9m
d2Z0X3N1cHBvcnRlZCkKPj4gKwkJcmV0dXJuIC1FT1BOT1RTVVBQOwo+PiArCj4+ICAJaWYgKGZl
YXR1cmUgJiBTQklfRldGVF9HTE9CQUxfRkVBVFVSRV9CSVQpCj4+ICAJCXJldHVybiBzYmlfZndm
dF9zZXQoZmVhdHVyZSwgdmFsdWUsIGZsYWdzKTsKPj4gIAo+PiBAQCAtNzE5LDYgKzc0MCwxMSBA
QCB2b2lkIF9faW5pdCBzYmlfaW5pdCh2b2lkKQo+PiAgCQkJcHJfaW5mbygiU0JJIERCQ04gZXh0
ZW5zaW9uIGRldGVjdGVkXG4iKTsKPj4gIAkJCXNiaV9kZWJ1Z19jb25zb2xlX2F2YWlsYWJsZSA9
IHRydWU7Cj4+ICAJCX0KPj4gKwkJaWYgKChzYmlfc3BlY192ZXJzaW9uID49IHNiaV9ta192ZXJz
aW9uKDIsIDApKSAmJgo+IAo+IFNob3VsZCBjaGVjayBzYmlfbWtfdmVyc2lvbigzLCAwKQoKT2gg
eWVzIHRoYXQgd2FzIGZvciB0ZXN0aW5nIHB1cnBvc2UgYW5kIEkgaW5jb3JyZWN0bHkgc3F1YXNo
ZWQgaXQuCgo+IAo+PiArCQkgICAgKHNiaV9wcm9iZV9leHRlbnNpb24oU0JJX0VYVF9GV0ZUKSA+
IDApKSB7Cj4+ICsJCQlwcl9pbmZvKCJTQkkgRldGVCBleHRlbnNpb24gZGV0ZWN0ZWRcbiIpOwo+
PiArCQkJc2JpX2Z3ZnRfc3VwcG9ydGVkID0gdHJ1ZTsKPj4gKwkJfQo+PiAgCX0gZWxzZSB7Cj4+
ICAJCV9fc2JpX3NldF90aW1lciA9IF9fc2JpX3NldF90aW1lcl92MDE7Cj4+ICAJCV9fc2JpX3Nl
bmRfaXBpCT0gX19zYmlfc2VuZF9pcGlfdjAxOwo+PiAtLSAKPj4gMi40Ny4yCj4+Cj4gCgpUaGFu
a3MsCgpDbMOpbWVudAoKPiBUaGFua3MsCj4gZHJldwoKCi0tIAprdm0tcmlzY3YgbWFpbGluZyBs
aXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
