Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1549E77188
	for <kvm-riscv@archiver.kernel.org>; Mon,  6 Jan 2025 10:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wIhjDp3RJplIoFX6sl2pXl1BPcWqo0qIihwbnolujnQ=; b=cAWyH0AKrOhRwd
	usdVqk+xQ/cCdn9SEMX3x/zMBcJHjJ5VJm3344Tq4fpWKb2Knp1pWuSmuD9BRtnnk1U80S5am72p+
	X8vBDnLh2axr+9QJYqXoEVIl8VXZABSBSck/cYWv86eJoKLCqxwX3YJfkdWkMFZyH3LOBLXfypBPZ
	8Re9cYKHV+w/9K/GxkZ9j+uIbYanjFr8jAEiVlXYnh8sASr3+drShbR+BsAVY0BgjUUoP1V1qtBEw
	Ktb1++Cmzc4f4RqMyG60l/C8rcr13pPFjZ9yV3n6SGcnVc+iEfYy0iqhXUcjhx0qKuQogPzlvkvgN
	VZP/ChRkyFhxLmgLt6MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUk5T-00000000pQP-2HOd;
	Mon, 06 Jan 2025 10:11:55 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUk5R-00000000pPz-2V2L
	for kvm-riscv@lists.infradead.org;
	Mon, 06 Jan 2025 10:11:54 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2156e078563so175309345ad.2
        for <kvm-riscv@lists.infradead.org>; Mon, 06 Jan 2025 02:11:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736158313; x=1736763113; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7nNzXHvCvx5cfEB7aLBAj3zATBDNr4fPLoierC9e9z0=;
        b=xMV76NXGkOf4fD+kog6kRb/wGBWPT+ESpF0jNd1eGj5rtdSRJOP8DT2PgAwkP24H13
         ou0WOJAYorcqFRt5rsUeJ5eTRuNbsLorHqfiBe9DZUozD27H3Q8ZMhV0nbwvCddkIgh9
         uMKk62EMUJYhYCQ6N5FEZMPmAb5HzQAGOu6cj1acpuxWzDaDvQY1rrF+gieq/3eeE5/t
         Vi2jOXFB+9Lefn+fcMuSqu5GUPWH+4ubXNNjHDEbUX1i0m+C7kyrnABI28XWMEtIKuJH
         yXXOUW5PNvnnNkyPXUS5I+ka3rYAv/nrm4RO12YIGhnymDSAzw+GZPAWHL0wf0GCTyh3
         eP+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736158313; x=1736763113;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7nNzXHvCvx5cfEB7aLBAj3zATBDNr4fPLoierC9e9z0=;
        b=vxuC2p3PWd6Wmsc4sd91m+XSN01lB2itUERjYIxoPPiNGL5kiwjEXf6seYU3yNtT8u
         CrW6mxMAac6wopPqJABvL48PhBlmH7aM8g8nAQmqgMBLT3GxfTMrvu7hjASqsig6YRfU
         2pEnGkxZ5JtxcQT35wgupR+LP+XjpuUaYd0fwnZPE1CYl7c3vHnlaxNESFpKjUwarWLO
         rIaJJQGkwsdVFPYy4/1s5dDkpYxlebqQzcg874zxIIZ6VxDJA8pbLHgNe/ZcefV87Qzh
         MBMtQf95BNrGBnqNAMVp8r3ZedaQ0Z8gjq1l56pe1wqgKotx23Z1AppB1A8KGmYf6J3U
         kc1g==
X-Forwarded-Encrypted: i=1; AJvYcCUIWffsFACTGc2jUMLQ43ecP4bhBoLM2JKOwChv8aIMHLGNK8x7Z3odsKyVtNW9qSCRBtdt+McO8KY=@lists.infradead.org
X-Gm-Message-State: AOJu0YwESozv6QSyqDhqFy6rFERpld6nlhklz57lMdaP5QT6Dd8uv/hJ
	87GeerySpHe4RZKFhIun9NCSRpEzymfnijMd3CMsOcBm56RXxcgNRD00PLeCnFM=
X-Gm-Gg: ASbGncswm8iebiYa//hjwFIgAQaZqmYO91EwGk5wid+RSpfZK+Q5zm/H7fTSUq2Fo58
	4W6OsmDtXzzPLjMH07Row6zR5j2KxQlqADuBKqCr/JgIBERf/WNus4yxNlgKW2VVOjBr95pH3F4
	h12qQVkya+RTW3BlFJJPuruFbbPResCSlDywKmmAQ7k9VyDP8/IUHkGVCg0WS3QzkdtRak8a+Bv
	0u+G2l4ZjRLDdEiKquY/75ihoRW/7uWfVJN2Bfk63yfEGrnGpGrxnuFEJi/KU8aPfw5x5Xh8V9c
	2XmW3dxDu3473BG5hIInNM6ATQ==
X-Google-Smtp-Source: AGHT+IFO+37IN1wvmUy/LvYiiE5d0fjJX5//1AkKi+DZydWL7qBtX1lnxZ9O36lro7vlSKtbDgpLuQ==
X-Received: by 2002:a17:902:da81:b0:211:fcad:d6ea with SMTP id d9443c01a7336-219e6f108b5mr688405345ad.45.1736158312840;
        Mon, 06 Jan 2025 02:11:52 -0800 (PST)
Received: from ?IPV6:2a01:e0a:e17:9700:16d2:7456:6634:9626? ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9cde37sm290040905ad.131.2025.01.06.02.11.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 02:11:52 -0800 (PST)
Message-ID: <ada1c6da-d91c-4177-9173-9a7cdb0af2fb@rivosinc.com>
Date: Mon, 6 Jan 2025 11:11:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v4 0/5] riscv: add SBI SSE extension tests
To: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Cc: Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>
References: <20241125162200.1630845-1-cleger@rivosinc.com>
Content-Language: en-US
From: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
In-Reply-To: <20241125162200.1630845-1-cleger@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_021153_640928_6A450A0A 
X-CRM114-Status: GOOD (  13.12  )
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

R2VudGxlIHBpbmcgPwoKVGhhbmtzLAoKQ2zDqW1lbnQKCk9uIDI1LzExLzIwMjQgMTc6MjEsIENs
w6ltZW50IEzDqWdlciB3cm90ZToKPiBUaGlzIHNlcmllcyBhZGRzIGFuIGluZGl2aWR1YWwgdGVz
dCBmb3IgU0JJIFNTRSBleHRlbnNpb24gYXMgd2VsbCBhcwo+IG5lZWRlZCBpbmZyYXN0cnVjdHVy
ZSBmb3IgU1NFIHN1cHBvcnQuIEl0IGFsc28gYWRkcyB0ZXN0IHNwZWNpZmljCj4gYXNtLW9mZnNl
dHMgZ2VuZXJhdGlvbiB0byB1c2UgY3VzdG9tIE9GRlNFVCBhbmQgREVGSU5FIGZyb20gdGhlIHRl
c3QKPiBkaXJlY3RvcnkuCj4gCj4gLS0tCj4gCj4gVjQ6Cj4gIC0gRml4IHR5cG8gc2JpX2V4dF9z
c19maWQgLT4gc2JpX2V4dF9zc2VfZmlkCj4gIC0gQWRkIHByb3BlciBhc20tb2Zmc2V0IGdlbmVy
YXRpb24gZm9yIHRlc3RzCj4gIC0gTW92ZSBTU0Ugc3BlY2lmaWMgZmlsZSBmcm9tIGxpYi9yaXNj
diB0byByaXNjdi8KPiAKPiBWMzoKPiAgLSBBZGQgLWRlcHMgdmFyaWFibGUgZm9yIHRlc3Qgc3Bl
Y2lmaWMgZGVwZW5kZW5jaWVzCj4gIC0gRml4IGZvcm1hdHRpbmcgZXJyb3JzL3R5cG8gaW4gc2Jp
LmgKPiAgLSBBZGQgbWlzc2luZyBkb3VibGUgdHJhcCBldmVudAo+ICAtIEFscGhhYmV0aXplIHNi
aS1zc2UuYyBpbmNsdWRlcwo+ICAtIEZpeCBhNiBjb250ZW50IGFmdGVyIHVubWFza2luZyBldmVu
dAo+ICAtIEFkZCBTU0UgSEFSVF9NQVNLL1VOTUFTSyB0ZXN0Cj4gIC0gVXNlIG12IGluc3RlYWQg
b2YgbW92ZQo+ICAtIG1vdmUgc2JpX2NoZWNrX3NzZSgpIGRlZmluaXRpb24gaW4gc2JpLmMKPiAg
LSBSZW1vdmUgc2JpX3NzZSB0ZXN0IGZyb20gdW5pdGVzdHMuY2ZnCj4gCj4gVjI6Cj4gIC0gUmVi
YXNlZCBvbiBvcmlnaW4vbWFzdGVyIGFuZCBpbnRlZ3JhdGUgaXQgaW50byBzYmkuYyB0ZXN0cwo+
IAo+IENsw6ltZW50IEzDqWdlciAoNSk6Cj4gICBrYnVpbGQ6IGFsbG93IG11bHRpcGxlIGFzbS1v
ZmZzZXRzIGZpbGUgdG8gYmUgZ2VuZXJhdGVkCj4gICByaXNjdjogdXNlIGFzbS1vZmZzZXRzIHRv
IGdlbmVyYXRlIFNCSV9FWFRfSFNNIHZhbHVlcwo+ICAgcmlzY3Y6IEFkZCAiLWRlcHMiIGhhbmRs
aW5nIGZvciB0ZXN0cwo+ICAgcmlzY3Y6IGxpYjogQWRkIFNCSSBTU0UgZXh0ZW5zaW9uIGRlZmlu
aXRpb25zCj4gICByaXNjdjogc2JpOiBBZGQgU1NFIGV4dGVuc2lvbiB0ZXN0cwo+IAo+ICBzY3Jp
cHRzL2FzbS1vZmZzZXRzLm1hayAgfCAgIDIyICstCj4gIHJpc2N2L01ha2VmaWxlICAgICAgICAg
ICB8ICAgMTAgKy0KPiAgbGliL3Jpc2N2L2FzbS9jc3IuaCAgICAgIHwgICAgMiArCj4gIGxpYi9y
aXNjdi9hc20vc2JpLmggICAgICB8ICAgODMgKysrCj4gIHJpc2N2L3NiaS10ZXN0cy5oICAgICAg
ICB8ICAgMTIgKwo+ICByaXNjdi9zYmktYXNtLlMgICAgICAgICAgfCAgIDk2ICsrKy0KPiAgcmlz
Y3YvYXNtLW9mZnNldHMtdGVzdC5jIHwgICAxOSArCj4gIHJpc2N2L3NiaS1zc2UuYyAgICAgICAg
ICB8IDEwNDMgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgcmlzY3Yv
c2JpLmMgICAgICAgICAgICAgIHwgICAgMyArCj4gIHJpc2N2Ly5naXRpZ25vcmUgICAgICAgICB8
ICAgIDEgKwo+ICAxMCBmaWxlcyBjaGFuZ2VkLCAxMjc4IGluc2VydGlvbnMoKyksIDEzIGRlbGV0
aW9ucygtKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgcmlzY3YvYXNtLW9mZnNldHMtdGVzdC5jCj4g
IGNyZWF0ZSBtb2RlIDEwMDY0NCByaXNjdi9zYmktc3NlLmMKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IHJpc2N2Ly5naXRpZ25vcmUKPiAKCgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2t2bS1yaXNjdgo=
