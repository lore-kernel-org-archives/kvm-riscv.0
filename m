Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B92C54FCD
	for <kvm-riscv@archiver.kernel.org>; Sat,  1 Aug 2026 08:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lyr/agf++7TafnGWVUPG88Gm/SIba09d4mKxkPv1J6Y=; b=QUkQyxy5Osjpls
	MXXhxxMUqar8kJ0X9lGO3sDaRpbCk6DYKzaqm87FJ5jpg/DpsXCn6gEsXGn7w86Q+omeCo/78itrI
	4U+jJ2jWz5TO1IzPWijgHywLk5rawaPXo3ewZih5oeMqn0NHGcQIA+8AAK6zqVXsXqjVaPZop2Vrl
	OgjcO0Swjjl7AXv642P6LonA6ItkCyubewQpmNvLNiK1ETLc+SKP6KcdxFdqBXy7BOI5GlsCvuZe+
	CnhszhQJAv+ijfa7FFvrsOlYF0Z9zX70NkQlzo6Cr1kSyDgbfapyIsVC2xZ4hLG5mtK1vljee5Jut
	xaqGdp7s4+d7J82gJkeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq5Be-0000000E3Rz-2TX1;
	Sat, 01 Aug 2026 08:35:18 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq5Bc-0000000E3R4-17rR
	for kvm-riscv@lists.infradead.org;
	Sat, 01 Aug 2026 08:35:17 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-47fd4531020so971836f8f.3
        for <kvm-riscv@lists.infradead.org>; Sat, 01 Aug 2026 01:35:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785573314; cv=none;
        d=google.com; s=arc-20260327;
        b=bDupp2XUBuJv5M8FCxDrIbHYy63GnxC6JJC/AGWvzjG4GqJeBX/XUV7jMmKJ4L1xTn
         XYuRTxivIATYv5ZDGJwn/hsHRBxhHmg65vQDYEDgq+v4u582GwJBoK8OlNX64bm7gkn3
         ImODdNjxSCRdmtx3VRjShfowuU/I6J3Z5eZ/WPd6jjFegl9II4urq+joiA6eZqEy+p5y
         AwGNmXBdFi4k8ffW1PPHJOXBWEcdqlKKhRufGdjTa6p2ef9STzWxd/+GYTkck9uvsLG2
         TkoU7TlCFZpVSTdgUZ1eJm5CYQu1nI5J/RrZCqYphdwfJt6HfqdOFcOeKKLB8L4/nAgt
         mBXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pjXyNG4M1zJXOBT1pnPYT12PCibopv8OC4ryVZx/p+M=;
        fh=sdev87TxZDsQqQyJMTRF+XzIwYR5x6KaEGSGPNzuOs0=;
        b=G0PBvbCL+ZXsjUl+9r09+Q1YlZOrGa1uX0l8QLyj7yCGV8HpET3VBq80fcli42PQvK
         PRD56bONcBaz8zSPT25FWZFUDi8SfNYpKu+R+oHqADnLj0hWUhX/5a82JYsPqftOaDfV
         osrSRjzw7Dbn667nMVTOpNPqqIMN3bu9NcduwZYHyXnLGoj+SAdjFIOtHOc/4zwiD5Gj
         4kBcvw57gSZ7UkmD1o1qgkoQgqijZGytqt70znar7yQdr5ZaFsKhdncI5JWY+H9k8bDw
         +D2hy3R/dX4ho71alTgZosoUjpXHrhtm9ylXGynVn1gnqQwCAHfeuaLO+lE1CGYLE5eh
         cV9w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1785573314; x=1786178114; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pjXyNG4M1zJXOBT1pnPYT12PCibopv8OC4ryVZx/p+M=;
        b=PeBjkeeNYcshlSU1yl55GtoBgYXOJ/y56ebJcN5qZVMZM6PdYSDTU1CWp+AVrGeODC
         ran1kB0J8dZACHR5wecQ7cnkW2bPvhKfd+h+TKso0FlrTqwkzalvgnf547BZxm4DChwI
         QjwYOcIc98vq2RelDE2BYGYCKj+3cOI4uqdPSmtjFNFMIDZ18lqsPER1K94FZwBzaJIQ
         JYZceip6dZGz7kjM88ztmzTd48+GcvdAMAs3nK8Lf0tF4NnDZo739uHNFd6jhC5sOz+2
         sIJp28kjohWGbvEoUkpnvSSfNTTitZjOnIMBimux9EgRzrkPUmCA6pZL1TosLAQjqPTr
         oObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785573314; x=1786178114;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pjXyNG4M1zJXOBT1pnPYT12PCibopv8OC4ryVZx/p+M=;
        b=rbybsH/GPzV0700kxbUh15i1kXNdJua4M0YCIBANGq7ereP4uh7VXPejV8nvsM1FKr
         jG8fW8kRrCGNXpy5T87oXhfw4hmrsywXQvOSr9F6Le6CRSOaVHupgbiTqS4fJtowz5+/
         Q1Na71qG9ShH7G3qNoCVcub+bP0OdckEfd4ehX6UtjKGr8cOBoIiVZuWQvUghsmPKMS4
         cDQeIak5CqlGvbTz/2ktR0KEX5pDI/mcJH2bqwM78D6enYnoexJ06DnrAICtJcpI9fXY
         Du5d1p8qDZjAlUEG3nttHGmvIY+6AydtYvnsNeyYM8YzSK2snesPHgxoRMqXHMvcSMfM
         JB4w==
X-Forwarded-Encrypted: i=1; AHgh+Rq8Q8+KfVORwIiE3BhPik/nRmb5505P0ZHzjE2IKtr8oo8BkSwGyDagaSNEqrKEiteZAv1YErWysUw=@lists.infradead.org
X-Gm-Message-State: AOJu0YwFeoTJ3Tbw7LjXluCuep0BPeKN+3BR20gqlPQq8CxwUZxi8ZO7
	mEKA73VTU+rbdsZy6dbtGSjjrb/FW8D9PAT3nrIOeAhteFyO39r7I7mM+XEjtHqkXNdakl8LImn
	h/3DaLwe72MO9spTbwU3e79WWLNQ1ZN54zMR8rN02yw==
X-Gm-Gg: AR+sD11RFdiG4w4AjmFFtTVfON11SzIP2k4KhnMj6f7CcsquH+m7nT0Kot0BqZSY+2A
	IbFpGhvXR7TDZRuFIHDS1C2k0gCLdJV4Hw3WyRgPpZMlLxgpo+/nvzRVJeMe0PLGquozoOptEzD
	iYnDc8Cun+uItAyxJAAy6GOEHu0IwQFywWpdMmJxCJ4LHny0SjZrb39Aryhr/Tzj52vP4a2UIdb
	rcIPlV7E20C8FUju0Dz7M7gDEyI6lx6X/EH2Xp21kpeCP1wDHZZS+rfuLGQ5Yn3WXhO6zhEcKk0
	23Gdf1ljFbM0pxoBD2HIXEhjup4qpGMH5oz9kq7kEC4mR6aTWz+G9M/iezmcHyVmyyq3YTiGXL6
	yiWu6F2CAIkaM2OAE3m1JFntxIKPYxu5Inh2x24dRpU4FeVgJiEa80ZcVnGckm1So
X-Received: by 2002:adf:f504:0:b0:47f:6e23:64d6 with SMTP id
 ffacd0b85a97d-47fd72b070bmr5048569f8f.16.1785573314037; Sat, 01 Aug 2026
 01:35:14 -0700 (PDT)
MIME-Version: 1.0
References: <20260731093833.1551341-1-wang.yechao255@zte.com.cn> <20260731093833.1551341-2-wang.yechao255@zte.com.cn>
In-Reply-To: <20260731093833.1551341-2-wang.yechao255@zte.com.cn>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 1 Aug 2026 14:05:02 +0530
X-Gm-Features: AUfX_mzbsVBnjZ3iyM-h0AGkXdQtsU_1jaxbI5xdNw7bsmFJ-QMjnUZ7jmAm6zw
Message-ID: <CAAhSdy1QwcYv_Dz0s5P_9RjRegJsJQz8fjiskGNmYYFXGOnB2A@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] RISC-V: KVM: Separate req and fallback_req masks
 in make_xfence_request
To: Wang Yechao <wang.yechao255@zte.com.cn>
Cc: kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_013516_357804_564B84D1 
X-CRM114-Status: GOOD (  20.93  )
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

T24gRnJpLCBKdWwgMzEsIDIwMjYgYXQgMzoxMuKAr1BNIFdhbmcgWWVjaGFvIDx3YW5nLnllY2hh
bzI1NUB6dGUuY29tLmNuPiB3cm90ZToKPgo+IFdoZW4gaGFuZGxpbmcgaGZlbmNlIHJlcXVlc3Rz
IGluIG1ha2VfeGZlbmNlX3JlcXVlc3QoKSwgdGhlIGN1cnJlbnQgY29kZQo+IHVzZXMgYSBzaW5n
bGUgJ2FjdHVhbF9yZXEnIHZhcmlhYmxlIGFuZCBhIHNpbmdsZSB2Y3B1X21hc2suIElmIGFueSBW
Q1BVCj4gZmFpbHMgdG8gZW5xdWV1ZSB0aGUgaGZlbmNlIGRhdGEgKGJlY2F1c2UgaXRzIHF1ZXVl
IGlzIGZ1bGwpLCB0aGUgcmVxdWVzdAo+IGZhbGxzIGJhY2sgdG8gJ2ZhbGxiYWNrX3JlcScgZm9y
IGFsbCBWQ1BVcywgZXZlbiBpZiBvdGhlciBWQ1BVcyBzdGlsbAo+IGhhdmUgYXZhaWxhYmxlIHF1
ZXVlIHNwYWNlLgo+Cj4gVGhpcyBjYW4gY2F1c2UgdW5uZWNlc3NhcnkgZmFsbGJhY2sgZm9yIGhl
YWx0aHkgVkNQVXMsIGFuZCBtb3JlIHNlcmlvdXNseSwKPiB0aG9zZSBoZWFsdGh5IFZDUFVzIHdp
bGwgbm90IHByb2Nlc3MgdGhlaXIgYWxyZWFkeS1lbnF1ZXVlZCBoZmVuY2UKPiByZXF1ZXN0cyBi
ZWNhdXNlIG5vICdyZXEnIGlzIHNldCBmb3IgdGhlbS4gQXMgYSByZXN1bHQsIHRoZWlyIHF1ZXVl
cyB3aWxsCj4gcXVpY2tseSBiZWNvbWUgZnVsbCBhcyB3ZWxsLCBkZWdyYWRpbmcgcGVyZm9ybWFu
Y2UgZm9yIFNNUCBndWVzdHMuCj4KPiBGaXggdGhpcyBieSBtYWludGFpbmluZyB0d28gc2VwYXJh
dGUgYml0bWFwczogb25lIGZvciBWQ1BVcyB0aGF0Cj4gc3VjY2Vzc2Z1bGx5IGVucXVldWVkIHRo
ZSBoZmVuY2UgZGF0YSAocmVxX3ZjcHVfbWFzaykgYW5kIGFub3RoZXIgZm9yCj4gdGhvc2UgdGhh
dCBmYWlsZWQgKGZhbGxiYWNrX3JlcV92Y3B1X21hc2spLiBUaGVuIHNlbmQgdGhlIGFwcHJvcHJp
YXRlCj4gcmVxdWVzdHMgdG8gZWFjaCBncm91cC4gVGhpcyBlbnN1cmVzIHRoYXQgZmFsbGJhY2sg
aXMgb25seSBhcHBsaWVkIHRvCj4gVkNQVXMgdGhhdCBhY3R1YWxseSBuZWVkIGl0LCBwcmVzZXJ2
aW5nIHRoZSBlZmZpY2llbmN5IG9mIHRoZSBub3JtYWwKPiBwYXRoIGZvciBvdGhlcnMuCj4KPiBG
aXhlczogMTNhY2ZlYzJkYmNjICgiUklTQy1WOiBLVk06IEFkZCByZW1vdGUgSEZFTkNFIGZ1bmN0
aW9ucyBiYXNlZCBvbiBWQ1BVIHJlcXVlc3RzIikKPiBTaWduZWQtb2ZmLWJ5OiBXYW5nIFllY2hh
byA8d2FuZy55ZWNoYW8yNTVAenRlLmNvbS5jbj4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQ
YXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClRoYW5rcywKQW51cAoKPiAtLS0KPiAgYXJjaC9y
aXNjdi9rdm0vdGxiLmMgfCAyMCArKysrKysrKysrKystLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMTIgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2t2bS90bGIuYyBiL2FyY2gvcmlzY3Yva3ZtL3RsYi5jCj4gaW5kZXggOTkzYjI1ZWE5
NGQ2Ny4uYzU0NTIyZGVjYWE2NCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS90bGIuYwo+
ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3RsYi5jCj4gQEAgLTMzMiwxMCArMzMyLDExIEBAIHN0YXRp
YyB2b2lkIG1ha2VfeGZlbmNlX3JlcXVlc3Qoc3RydWN0IGt2bSAqa3ZtLAo+ICB7Cj4gICAgICAg
ICB1bnNpZ25lZCBsb25nIGk7Cj4gICAgICAgICBzdHJ1Y3Qga3ZtX3ZjcHUgKnZjcHU7Cj4gLSAg
ICAgICB1bnNpZ25lZCBpbnQgYWN0dWFsX3JlcSA9IHJlcTsKPiAtICAgICAgIERFQ0xBUkVfQklU
TUFQKHZjcHVfbWFzaywgS1ZNX01BWF9WQ1BVUyk7Cj4gKyAgICAgICBERUNMQVJFX0JJVE1BUChy
ZXFfdmNwdV9tYXNrLCBLVk1fTUFYX1ZDUFVTKTsKPiArICAgICAgIERFQ0xBUkVfQklUTUFQKGZh
bGxiYWNrX3JlcV92Y3B1X21hc2ssIEtWTV9NQVhfVkNQVVMpOwo+Cj4gLSAgICAgICBiaXRtYXBf
emVybyh2Y3B1X21hc2ssIEtWTV9NQVhfVkNQVVMpOwo+ICsgICAgICAgYml0bWFwX3plcm8ocmVx
X3ZjcHVfbWFzaywgS1ZNX01BWF9WQ1BVUyk7Cj4gKyAgICAgICBiaXRtYXBfemVybyhmYWxsYmFj
a19yZXFfdmNwdV9tYXNrLCBLVk1fTUFYX1ZDUFVTKTsKPiAgICAgICAgIGt2bV9mb3JfZWFjaF92
Y3B1KGksIHZjcHUsIGt2bSkgewo+ICAgICAgICAgICAgICAgICBpZiAoaGJhc2UgIT0gLTFVTCkg
ewo+ICAgICAgICAgICAgICAgICAgICAgICAgIGlmICh2Y3B1LT52Y3B1X2lkIDwgaGJhc2UgfHwK
PiBAQCAtMzQ1LDEwICszNDYsMTAgQEAgc3RhdGljIHZvaWQgbWFrZV94ZmVuY2VfcmVxdWVzdChz
dHJ1Y3Qga3ZtICprdm0sCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb250aW51
ZTsKPiAgICAgICAgICAgICAgICAgfQo+Cj4gLSAgICAgICAgICAgICAgIGJpdG1hcF9zZXQodmNw
dV9tYXNrLCBpLCAxKTsKPiAtCj4gLSAgICAgICAgICAgICAgIGlmICghZGF0YSB8fCAhZGF0YS0+
dHlwZSkKPiArICAgICAgICAgICAgICAgaWYgKCFkYXRhIHx8ICFkYXRhLT50eXBlKSB7Cj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgYml0bWFwX3NldChyZXFfdmNwdV9tYXNrLCBpLCAxKTsKPiAg
ICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiArICAgICAgICAgICAgICAgfQo+Cj4g
ICAgICAgICAgICAgICAgIC8qCj4gICAgICAgICAgICAgICAgICAqIEVucXVldWUgaGZlbmNlIGRh
dGEgdG8gVkNQVSBoZmVuY2UgcXVldWUuIElmIHdlIGRvbid0Cj4gQEAgLTM1NiwxMCArMzU3LDEz
IEBAIHN0YXRpYyB2b2lkIG1ha2VfeGZlbmNlX3JlcXVlc3Qoc3RydWN0IGt2bSAqa3ZtLAo+ICAg
ICAgICAgICAgICAgICAgKiBhIG1vcmUgY29uc2VydmF0aXZlIGhmZW5jZSByZXF1ZXN0Lgo+ICAg
ICAgICAgICAgICAgICAgKi8KPiAgICAgICAgICAgICAgICAgaWYgKCF2Y3B1X2hmZW5jZV9lbnF1
ZXVlKHZjcHUsIGRhdGEpKQo+IC0gICAgICAgICAgICAgICAgICAgICAgIGFjdHVhbF9yZXEgPSBm
YWxsYmFja19yZXE7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgYml0bWFwX3NldChmYWxsYmFj
a19yZXFfdmNwdV9tYXNrLCBpLCAxKTsKPiArICAgICAgICAgICAgICAgZWxzZQo+ICsgICAgICAg
ICAgICAgICAgICAgICAgIGJpdG1hcF9zZXQocmVxX3ZjcHVfbWFzaywgaSwgMSk7Cj4gICAgICAg
ICB9Cj4KPiAtICAgICAgIGt2bV9tYWtlX3ZjcHVzX3JlcXVlc3RfbWFzayhrdm0sIGFjdHVhbF9y
ZXEsIHZjcHVfbWFzayk7Cj4gKyAgICAgICBrdm1fbWFrZV92Y3B1c19yZXF1ZXN0X21hc2soa3Zt
LCByZXEsIHJlcV92Y3B1X21hc2spOwo+ICsgICAgICAga3ZtX21ha2VfdmNwdXNfcmVxdWVzdF9t
YXNrKGt2bSwgZmFsbGJhY2tfcmVxLCBmYWxsYmFja19yZXFfdmNwdV9tYXNrKTsKPiAgfQo+Cj4g
IHZvaWQga3ZtX3Jpc2N2X2ZlbmNlX2koc3RydWN0IGt2bSAqa3ZtLAo+IC0tCj4gMi4zOS4zCj4K
Ci0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
