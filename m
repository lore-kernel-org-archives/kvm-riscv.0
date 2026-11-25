Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6CF606A332
	for <kvm-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 05:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CbHoxjfS;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=i9tfo1pv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=a8RRJXWVXJLGRsIDZ4leZqu8p/kiCRY1km2tFIzNX00=; b=CbHoxjfS3FFtLrrO4RQNq/0o7l
	CN0uE0pIPQyI56vpH2xLWj8/IvkOBvrHVzm3FyEF9Onc9b7PvPWqC6o3Z6s0olhfaAXHot8PsR428
	ov/VQqSS4y3YSXSjDDaX9QX+gKTpp648FSwAVZln0e1/+h9dcbPmGbljn1eqiCS8yTJyVBoZBLBVp
	w+gLfpAbOYUuL1iw61SFi38AyWA0k2AuJ2rMnl3pv8M6Y8D2F/wtDFgMuW+CAQ5+P/eTWR0vXUQlp
	uTtfPeCyPBE4AvFkZftDaPt0OPIJe93dq1f12ErrgN0wonbks4+4aVQ/L7dqxoF5UQP4jjent4cfS
	sUIn4sIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW5tH-00000008UEP-1Wmg;
	Wed, 25 Nov 2026 05:49:59 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW5tE-00000008UDR-2t7o
	for kvm-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 05:49:58 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-49412eb1474so3421829f8f.3
        for <kvm-riscv@lists.infradead.org>; Tue, 24 Nov 2026 21:49:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795585794; cv=none;
        d=google.com; s=arc-20260327;
        b=eB7BSFsuAHQ7ObK+axAEOnnwd2N/Vl8a0MQxTlPyJykt45yIfmgCPTWyuzexR+Z8r9
         jIol9OOQAARULZzjN95UoMkZPxZPZKDY4YWiigu8r70eBkeDBwWCzG6FUrAao1Ahnns4
         XQsGJmwuXju3p3DenlLsyOTN37/gp2sPbRgKkSPzRR0Mp70Bh2190uAS7jW3gcXNyp/c
         3T29DpCL4xDnxzhFPEjgvEdPJkGy8G6jZeMI8SJokF0T0NsJLFPrAj98WXrtjKhwzSBZ
         TpZbBRyQ05hoigMHVWeWi0yLJXJFHuBQJeClcolUehUeXLsmQd9TI1MSz3VLxpW7H8aV
         Qthg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M0m3xJ6SKs4qbuy6HlPELsinPaGfttdr+a2t/1R0rkE=;
        fh=+YceQtyUAoddN35AnJlDCQQezKKCWPKlioMaQejrsc0=;
        b=ODTpbG/kUTI/LtRZJHtzo6PukWAGoxJCmpQcGqI9p1U771SKP2VyRA7oFv/YdgAxEi
         lRaYnhDR40bMBgeVRHZpLMu5ucVeZwgk5YYcJn5ws2lOIoNvOFm49Ap0y8YCjypWLuyD
         5fXQqWTz7+tkk6l0rxq9aPDPLyEmXBnPAlDYqX4nOHz5BhhPQBxPONKfRXwMnW1lp5o7
         svNattYdi4nQ4j2UuPb+3XfhrTj+WH8SFaWH5ZjyNd2rwcydpsUq80VXnvSwR3r4CoCg
         H6bZ5Uv8wV8n/9pGjjc0yjAC4g/KWeN1iiI31Tfsj0HEBUoI4jcAZM1cY/po6d7ecsEY
         oiTw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1795585794; x=1796190594; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M0m3xJ6SKs4qbuy6HlPELsinPaGfttdr+a2t/1R0rkE=;
        b=i9tfo1pvRamSs2ibSiG6AnTIAm4eihK95gRHKLaJhnSRDYWt641nDu9r+nobFjy1+x
         0IKHy6RvhJSlqjUJQ12D0nj12H09lDqyEZZgB//yu/cmChTbsPapOTqc5d0cLjNMciS4
         063ELBdazW9dIKSaGo935kuex6PiXiGx6Ybx1bdROk3gnuujv/QqxEoSC004cBJFR+ZI
         w3YY66QKO5P4FHFUJfi3D06cxx2teEl3YvZouaEktgoVN0Jpt3Hx0XZ4utFz2SyMjzSM
         OzboUY2O8bJGWKEnqC9GEe9itorFy71dyxD76W/pOt3RyfszOUUvZyyQ5zlkgHCcdJ6i
         5Kxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795585794; x=1796190594;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M0m3xJ6SKs4qbuy6HlPELsinPaGfttdr+a2t/1R0rkE=;
        b=HM/S8shpfgQY5Bi3CIF8q+qY02WckjqKvMGvPFdBeOoxk6qDj34ID7uq1Kt63TCEVj
         dUjA+eVMh1QDNDv/6tw02UAOGYi/aIIdfFS2Z/MlrxnYVcZ/CUFTEdrFJm3UtS0A2+i0
         8bfiXMYCkEghTG/G9tB7kEtyFctjX9BWbCT+7SytIZA5KUg4Mw+Dq3SRjG74Hgdh8PH8
         WKHaU+BuJwQhx+qx4t+uBAuGcHmAi6+FLFxqGgUvTscrvQeiEaE55wlaEx1exCC6NID2
         nGCiZmOqQlHhXwU45A7YA12KWVs9Aji6BViMZBwHwihANDm0E+bQpz99UH1TNCnD1KQk
         K1qQ==
X-Forwarded-Encrypted: i=1; AL+hErEn8rOxeAMNts9qS14cGhZ/TuJPM4k0HMlag9MeiT8GTT7cch1TK1fPwRgBdcbsA7GUzCl8xyo0Pwo=@lists.infradead.org
X-Gm-Message-State: APuU4Z8GJuI7Q0YFGIN0L3SuJmEVMPqtSSxWi2LP8D06dVnSk32dUQOJ
	G6uyD5+GDrZFOhlDllhJWNx442pldFpG8iEzCB788jhwtN+wmj9zN1kvtK/v+uGNkE/YGKltU08
	j2WrI2M6LlVB5vh0K9k8xzIoRAgQNNSkscCzJj4uP+w==
X-Gm-Gg: AZFdTZdPIAAnycopiVEE97sgShoF/8paWG4wDDLHq122u/ryV1YVovl4oFiMYvcXhRp
	ZkjMWCuo9k78RG+4AXTWYukO3LPYu+ej621q3Yw4XC++TboplQ85QtDTJe3PghlYK9uqXiCsEdg
	Kj3wO56hnb21KsmeVwqdurnuPmzsIHjQI8mt4bwfkyUYO7XVHoDmjL7pbmyBYHPMrbcYS283F26
	Me0Bg0ogSXOjZ9JQ+QLI/3RrmLhqrhEKr6huhgn4MvKQH0yiVAz8TOh88N+XeV3IuN7qDeeK5bj
	Wf8GqLaIzB/a2Fq7ixR5a0a1ay332JD6rfnWT5e7JNnJALMMBTMypxjBqsz4AOHFcDPH9hqjzFz
	uvREofOTec0ZP/jBQrdh2NU93HLM1yCrSWfOJR2KVA8vDJFVxvCo1IQlnxZ9sB5Mm5FiVJWnoVu
	qfYqx4elqTCKQhTU7iwzsjNf578jhKvNMos2Jq7/9+c+jiuP6fSXmPG7k=
X-Received: by 2002:a5d:6f13:0:b0:4a7:a7d2:eb45 with SMTP id
 ffacd0b85a97d-4abb6d04777mr28721728f8f.44.1795585794414; Tue, 24 Nov 2026
 21:49:54 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260921111402.120911-1-suunj1331@gmail.com> <20260921111402.120911-2-suunj1331@gmail.com>
In-Reply-To: <20260921111402.120911-2-suunj1331@gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 25 Nov 2026 11:19:43 +0530
X-Gm-Features: Aa3M54rM0lMmhvxe-VB9jSUcy69cdiFPwqZiJIiAYrdwNUAJS1EnS9yl8AAOxXc
Message-ID: <CAAhSdy0r1WzzK-0rik+qkofG6RWHw__KaYus7LTkGdF-4=fnaA@mail.gmail.com>
Subject: Re: [PATCH v1 1/5] KVM: riscv: Age all G-stage PTEs in a GFN range
To: SeungJu Cheon <suunj1331@gmail.com>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Paolo Bonzini <pbonzini@redhat.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Jinyu Tang <tjytimi@163.com>, 
	Wang Yechao <wang.yechao255@zte.com.cn>, kvm-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_214956_750777_D13D4396 
X-CRM114-Status: GOOD (  13.99  )
X-Spam-Score: -2.1 (--)
X-BeenThere: kvm-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <kvm-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/kvm-riscv/>
List-Post: <mailto:kvm-riscv@lists.infradead.org>
List-Help: <mailto:kvm-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/kvm-riscv>,
 <mailto:kvm-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gTW9uLCBTZXAgMjEsIDIwMjYgYXQgNDo0NOKAr1BNIFNldW5nSnUgQ2hlb24gPHN1dW5qMTMz
MUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4ga3ZtX2FnZV9nZm4oKSBhbmQga3ZtX3Rlc3RfYWdlX2dm
bigpIG9ubHkgb3BlcmF0ZSBvbiB0aGUgRy1zdGFnZQo+IGxlYWYgY292ZXJpbmcgcmFuZ2UtPnN0
YXJ0LiBUaGV5IGFsc28gd2FybiB1bmxlc3MgdGhlIHJhbmdlIHNpemUgaXMKPiBleGFjdGx5IDRL
LCAyTSwgb3IgMUcuCj4KPiBUaGUgTU0gY2FuIHBhc3MgbGFyZ2VyIHJhbmdlcyB3aGVuIGJhdGNo
aW5nIHRoZSBQVEVzIG9mIGEgbGFyZ2UgZm9saW8uCj4gRm9yIGV4YW1wbGUsIGEgNjRLIG1USFAg
cmFuZ2UgdHJpZ2dlcnMgdGhlIHdhcm5pbmcgYW5kIG9ubHkgdGhlIGZpcnN0Cj4gNEsgbGVhZiBp
cyBhZ2VkLCBsZWF2aW5nIHRoZSBBY2Nlc3NlZCBiaXRzIG9mIHRoZSByZW1haW5pbmcgbGVhdmVz
Cj4gdW5jaGFuZ2VkLgo+Cj4gVGhpcyBjYW4gYmUgcmVwcm9kdWNlZCBvbiBhbiBydjY0IGhvc3Qg
d2l0aCBTdmFkdSBieSBkaXNhYmxpbmcgMk0gVEhQLAo+IGVuYWJsaW5nIDY0SyBtVEhQLCBhbmQg
cnVubmluZzoKPgo+IGFjY2Vzc190cmFja2luZ19wZXJmX3Rlc3QgLXMgYW5vbnltb3VzX3RocAo+
Cj4gVGhpcyByZXN1bHRzIGluOgo+Cj4gV0FSTklORzogYXJjaC9yaXNjdi9rdm0vbW11LmM6MzYy
IGF0IGt2bV9hZ2VfZ2ZuKzB4MjEwLzB4MzcwCj4gLi4uCj4gWzxmZmZmZmZmZjgwMGM4ZmM4Pl0g
a3ZtX2FnZV9nZm4rMHgyMTAvMHgzNzAKPiBbPGZmZmZmZmZmODAwOTVjOTA+XSBrdm1fbW11X25v
dGlmaWVyX2NsZWFyX3lvdW5nKzB4MjUwLzB4NDc4Cj4gWzxmZmZmZmZmZjgwYWU1MzJlPl0gX19t
bXVfbm90aWZpZXJfY2xlYXJfeW91bmcrMHhkZS8weDFhMAo+IFs8ZmZmZmZmZmY4MDkzMmY3Nj5d
IHdhbGtfcHVkX3JhbmdlKzB4ODZlLzB4MTY4OAo+IFs8ZmZmZmZmZmY4MGExODcyMD5dIHdhbGtf
cGdkX3JhbmdlKzB4NTE4LzB4MTdiMAo+IFs8ZmZmZmZmZmY4MGExOWFhMj5dIF9fd2Fsa19wYWdl
X3JhbmdlKzB4ZWEvMHg1ODAKPiBbPGZmZmZmZmZmODBhMWE0MjI+XSB3YWxrX3BhZ2VfcmFuZ2Ur
MHgzYS8weDgwCj4gWzxmZmZmZmZmZjgwOTMxZGMwPl0gdHJ5X3RvX2luY19tYXhfc2VxKzB4NTIw
LzB4ZTY4Cj4gWzxmZmZmZmZmZjgwOTM5ZGMwPl0gbHJ1X2dlbl9zZXFfd3JpdGUrMHhkMDgvMHgx
MzEwCj4KPiBXYWxrIGFsbCBHLXN0YWdlIGxlYXZlcyBpbiB0aGUgcmVxdWVzdGVkIHJhbmdlLiBB
ZHZhbmNlIGJ5IHRoZSBsZWFmCj4gc2l6ZSB3aGVuIGEgbWFwcGluZyBpcyBmb3VuZCwgb3IgYnkg
dGhlIHNpemUgb2YgdGhlIG5vbi1wcmVzZW50IHJlZ2lvbgo+IGF0IHRoZSBsZXZlbCB3aGVyZSB0
aGUgd2FsayBzdG9wcGVkLiBXaGVuIHRlc3RpbmcgdGhlIGFnZSwgcmV0dXJuIGFzCj4gc29vbiBh
cyBhIHlvdW5nIGxlYWYgaXMgZm91bmQuCj4KPiBSZW1vdmUgdGhlIHJhbmdlLXNpemUgd2Fybmlu
ZyBzaW5jZSBhcmJpdHJhcnkgR0ZOIHJhbmdlcyBhcmUgdmFsaWQuCj4KPiBGaXhlczogOTk1NTM3
MWNjMDE0ICgiUklTQy1WOiBLVk06IEltcGxlbWVudCBNTVUgbm90aWZpZXJzIikKPiBTaWduZWQt
b2ZmLWJ5OiBTZXVuZ0p1IENoZW9uIDxzdXVuajEzMzFAZ21haWwuY29tPgoKTEdUTS4KClJldmll
d2VkLWJ5OiBBbnVwIFBhdGVsIDxhbnVwQGJyYWluZmF1bHQub3JnPgoKUmVnYXJkcywKQW51cAoK
LS0gCmt2bS1yaXNjdiBtYWlsaW5nIGxpc3QKa3ZtLXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9rdm0tcmlzY3YK
