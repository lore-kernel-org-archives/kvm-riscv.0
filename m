Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5633C5AC9F
	for <kvm-riscv@archiver.kernel.org>; Fri,  7 Aug 2026 16:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gzh2tExMbVddY0J/Ak4XEIoDXMbhJvNTgt1TqdWvaHI=; b=j8EDPfRhtI3LBz
	z0azT3HnTQkGKKj6P15DQ1+oOHR2/TIGFdFubtaOxeD7qj1NR950lSzh4zIzc6AqhD6CLLUJrZeBs
	MCCwJjltc7gSou1crjlEtWoC5Sk91XUtU/G+gBsT9+CQTEnc0mvOn9dy8ZxZGtr5VT4B1zmqZ4cru
	ov3kpqKswI7uThT5S+lNcXHWY+AlJbchM5PHOQloxlFdrMRKh+lWGuA6o7HLatrpK0UJEB/BRsL0R
	6fKfP9i0J7YzUgb/Rqna5viGnNLV2AYySxoCDwpOkpFnPRHjPcfad2nOyuI6gL3fxEZDusQu3YLqx
	4Ds84NWywJcLbOzoRYQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNca-00000008RVa-1mBb;
	Fri, 07 Aug 2026 16:40:36 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsNcY-00000008RUO-2CPZ
	for kvm-riscv@lists.infradead.org;
	Fri, 07 Aug 2026 16:40:35 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-47fecbb7000so1893910f8f.2
        for <kvm-riscv@lists.infradead.org>; Fri, 07 Aug 2026 09:40:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786120832; cv=none;
        d=google.com; s=arc-20260327;
        b=iikKBXaaT22X3oBtXAn5yN6zoB7rYXr87TqaKMJqZos6fINvSKEtEoAtWQX49qlXex
         YYUBZdJbI+/OIC3qaWQQUCMEu6OFPn402FbZ9/tqtPIdTHjNWfbP2JQ3eywXrDKZKGBD
         SEXCVkSMD4xUjiLiiPhC0WU05DEYRsX17aZtJfn4Hqiyh+UNGKHrz7X/EWqnpaz9CBMa
         iTQlFoCf62K8yUjG52H3c79uXzHrlianA2fL8UVzgovXMXhaydwBP7fxgeSNvJzVOYiE
         f9fJJlHuMSzzCnyVW+LKIOLzkfUWZxhyzQaJUTy9vE6ecxFOtlqkyUtgN/hbl+DXO4hs
         E+5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M3ZQ4lwGybEnFTTAAMTdnaC/1E614SavXr5HowXfnfg=;
        fh=VnVai+9Xd4G3PsGD6l/fzI1teyKplbUS+gYC0a3RLVM=;
        b=D0CXTvPOumUdYf4jgcBHEOvi1AYWnRO/mMwgfkmL4jIO69jEFzvOx3XHQntUtnR9rB
         w3Ns1+Y5WC84ukMDy+0rsIlouetvp401y0c1Ln2jBu32oVxc36+JyFuLxz5JVUBrYbsR
         nzqvCvb20QWlPRjemqVh/CbReYfMrUcpbXw96wHUAodRJHlHwb+4YihPgMDFwS8elLAK
         ba4uzZYKI/ziRIZmAberHL55JptvKvlrsblcmHBT7T3KT39gmnG+e9vT2glR4xzYo+ov
         1gK7x1rDIVkaRhiRRNaiQG73e5z1pd9kZdLucwIYjHqahXDdDm3Quc601YINEWDx3b20
         U6dg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1786120832; x=1786725632; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M3ZQ4lwGybEnFTTAAMTdnaC/1E614SavXr5HowXfnfg=;
        b=aK85/PQT3eHcSXe6JGMZ/90LytbE5YARbJsgXQsiNQuf7h+J6TRFU1LD+Qbce+AL8Y
         ArH46BNhYp1MN/YXeSvEXAP6k6IHybfaEhyPUHDAP8qrWjTx1Cf+yySCoVzOHoz/hz/3
         H4AmrIzMlCJHAk/PmF5r7wN6m4ghnR+K0KKvW1LoyFEmsuHwPmFIjHIVi5LSq4a4bdE9
         TInrsFMUrmr08uHSPHpkfq4nRDcyWFm7HvtETtX6FCdOtaeFs5i49B0OW21q11oVBm7X
         iUjlKLqah5Y9vIZpd7OXxsuNFkdb43zBqnMSDslfqD7EBwvR07WTAKeLYjDpqIfRNEHN
         aTFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786120832; x=1786725632;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M3ZQ4lwGybEnFTTAAMTdnaC/1E614SavXr5HowXfnfg=;
        b=qO0m5lLAua2qM2obuc0h9UJRlYYy0YS8M0iP14qd/fxhxttWvZpEd9I7jag90e13DZ
         /Yc5Spn1tWiqjZznzhvPy17OVA/GD1IXEGAURaEPCfFe936sPyE27vrmu1NEllY8LrTh
         +WZsE5S3mDkKU0qej273QgOjWA5VPB2lG1NHF8aMHC26EprCX/xaGWz7jNaXHpOVei+B
         uRsdM9g42HZBwj+FecRCvlU0djARA6UYCfo34/HhFP4QBwO5on62h48hvTvyCzWXW15n
         qOY/apJOhIlqd7SKAvPMfMTt4UJMio7AKzJ1sfb7HzuWIiFpSQNx4iwGcfwnDRlVnUN2
         SgiQ==
X-Forwarded-Encrypted: i=1; AHgh+RoWC/fVs7p+U5Nfb4VX06f7ed/VqlzstQnmwCuTOX+Cg4IUwBjs7i5FJJFkKHsKB3I5yNxdFHthUqA=@lists.infradead.org
X-Gm-Message-State: AOJu0YyaZFPClQwt09uAkMIH0m+WPu5vzvYz2H/5KHT61WG0ttyMl5xb
	MMQMR7XdCGJ7awPFgg//ganwDvlDBtej/1hALiCYXP+ra90ic5TG+FGo6WwrE09l3eORNYdt6VR
	IluaO8RgGA9Yar7G0F7v+Sb7J538xUUGxyYe4T7iuqA==
X-Gm-Gg: AR+sD11JOO4ky+pZkJCuw7whxaRlfrUoA1B5RuuxPNPHPaGkfb46DB/5GzRsL/ECDK9
	98nARuYA+5C4okFuZCEWhIbtJKEnQALlKLHKnPEhwdUrBknOQAfifor3GAy0qdoEpDIf//3Ze9X
	CNub44oOmwVMdehPHTcExMp3S8MUAPt1hyADJ3bDw17Np1oJvVGWXnU+vs4X3T92iDXjJETSZdx
	YItaIrzW8D5X+b0T5aKWUo2eToESFWIfh+7t8am5L/fVDNoYHyuFJcpeJdc4wcLJb5KiZQ8b9Hj
	WAmaLlZwval19D94mEJ9OJH6Fj+mSdnkQbO5yIQKQ44gy1UH+7x2e1F6B4XTK9lJF+vfixjvadi
	hfXSfeiDgJkyzmmn3OBKc5yvwa4hseW++zVlOC6iDHwYkv5BlpxuMU4sgpsrkWm6l
X-Received: by 2002:adf:ec0e:0:b0:47f:4dfc:ca1e with SMTP id
 ffacd0b85a97d-48130e7e846mr1247509f8f.5.1786120832608; Fri, 07 Aug 2026
 09:40:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260718033646.002.31dc89f2-caplitmus-rv@iscas.ac.cn>
In-Reply-To: <20260718033646.002.31dc89f2-caplitmus-rv@iscas.ac.cn>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 7 Aug 2026 22:10:20 +0530
X-Gm-Features: AUfX_mxaKOttqZ90LkDJu3zXy0Nxt0iXONOyY8DEizW4DWkuOLmRJN7Yk8VckPQ
Message-ID: <CAAhSdy1pw+g84HFq9okYcfmG9_nV=Te8q0YHt5yNtf6zsYP9sQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Allow memslots ending at the GPA limit
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Paolo Bonzini <pbonzini@redhat.com>, Yifei Jiang <jiangyifei@huawei.com>, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_094034_615705_7D50F2AE 
X-CRM114-Status: GOOD (  14.97  )
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

T24gU2F0LCBKdWwgMTgsIDIwMjYgYXQgOToyMuKAr0FNIFBlbmdwZW5nIEhvdSA8cGVuZ3BlbmdA
aXNjYXMuYWMuY24+IHdyb3RlOgo+Cj4gS1ZNIG1lbXNsb3RzIGRlc2NyaWJlIGhhbGYtb3BlbiBy
YW5nZXMgW2Jhc2VfZ2ZuLCBiYXNlX2dmbiArIG5wYWdlcykuIEEKPiBzbG90IGVuZGluZyBleGFj
dGx5IGF0IHRoZSBndWVzdCBwaHlzaWNhbC1hZGRyZXNzIGxpbWl0IGhhcyBpdHMgZmluYWwgcGFn
ZQo+IGJlbG93IHRoYXQgbGltaXQgYW5kIGlzIHZhbGlkLgo+Cj4gVGhlIGN1cnJlbnQgZ3JlYXRl
ci10aGFuLW9yLWVxdWFsIGNvbXBhcmlzb24gcmVqZWN0cyBhIHZhbGlkIGJvdW5kYXJ5IGNhc2Uu
Cj4gVXNlIGEgc3RyaWN0IGdyZWF0ZXItdGhhbiBjb21wYXJpc29uLCBtYXRjaGluZyBlcXVpdmFs
ZW50IEtWTSBhcmNoaXRlY3R1cmUKPiBjaGVja3MuCj4KPiBGaXhlczogOWQwNWMxZmVlODM3ICgi
UklTQy1WOiBLVk06IEltcGxlbWVudCBzdGFnZTIgcGFnZSB0YWJsZSBwcm9ncmFtbWluZyIpCj4g
U2lnbmVkLW9mZi1ieTogUGVuZ3BlbmcgSG91IDxwZW5ncGVuZ0Bpc2Nhcy5hYy5jbj4KCkxHVE0u
CgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFpbmZhdWx0Lm9yZz4KClF1ZXVlZCB0
aGlzIHBhdGNoIGZvciBMaW51eC03LjMKClRoYW5rcywKQW51cAoKCj4gLS0tCj4gIGFyY2gvcmlz
Y3Yva3ZtL21tdS5jIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS9tbXUuYyBiL2FyY2gv
cmlzY3Yva3ZtL21tdS5jCj4gaW5kZXggMDgyZjliMjYxNzMzOC4uZDNjMGM2OTlhZGI2MCAxMDA2
NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS9tbXUuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL21t
dS5jCj4gQEAgLTE4NCw3ICsxODQsNyBAQCBpbnQga3ZtX2FyY2hfcHJlcGFyZV9tZW1vcnlfcmVn
aW9uKHN0cnVjdCBrdm0gKmt2bSwKPiAgICAgICAgICAqIFByZXZlbnQgdXNlcnNwYWNlIGZyb20g
Y3JlYXRpbmcgYSBtZW1vcnkgcmVnaW9uIG91dHNpZGUgb2YgdGhlIEdQQQo+ICAgICAgICAgICog
c3BhY2UgYWRkcmVzc2FibGUgYnkgdGhlIEtWTSBndWVzdCBHUEEgc3BhY2UuCj4gICAgICAgICAg
Ki8KPiAtICAgICAgIGlmICgobmV3LT5iYXNlX2dmbiArIG5ldy0+bnBhZ2VzKSA+PQo+ICsgICAg
ICAgaWYgKChuZXctPmJhc2VfZ2ZuICsgbmV3LT5ucGFnZXMpID4KPiAgICAgICAgICAgICAga3Zt
X3Jpc2N2X2dzdGFnZV9ncGFfc2l6ZShrdm0tPmFyY2gucGdkX2xldmVscykgPj4gUEFHRV9TSElG
VCkKPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FRkFVTFQ7Cj4KPiAtLQo+IDIuNDMuMAo+Cgot
LSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
