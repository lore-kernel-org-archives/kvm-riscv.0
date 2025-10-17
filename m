Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECCC5CCD195
	for <kvm-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 09:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RBNjUA/rowl9zLsqRn62O2SLuNYhDPkmRS0Ahls5GOc=; b=3Fl39IK00rtQlU
	gsCwJ7h6bkRHT+ndvoNK0O6cUO8/3R3WYaSHOkb4i0kpXc5nD7Nw5CBGCIAIt1rWo4MTVO7h4FPa+
	vYI62RVt00z9CAm1J5IcyqclUbOBuSn8NRjH4NIK3nDutBEqgkQP5hHFWYayITmK7fS1fsZcg9so/
	M7WfQIiRXo/4liRcFG2gdMhkc04/ulA9VOhEgnJn9LXbsc2Vj/Yd6Q94dMhv2XNE3zl9WZN3kYqss
	ZIRn91vs/MMSsSCvniB39Xh05fh85IJu43HOnXmcaZAO0uE4dzkypatrqy2oKgqOt6BH9HpzURV3R
	qQaTJG5wpgHhtSUNR/OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9h9x-00000007Nvp-1YaI;
	Fri, 17 Oct 2025 09:54:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9h9w-00000007NvP-2sM3
	for kvm-riscv@lists.infradead.org;
	Fri, 17 Oct 2025 09:54:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 22A116292A
	for <kvm-riscv@lists.infradead.org>; Fri, 17 Oct 2025 09:54:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C89D4C113D0
	for <kvm-riscv@lists.infradead.org>; Fri, 17 Oct 2025 09:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760694843;
	bh=W5+0QfU+et/jmk6dv8dDZbEtFHejPJe/S2iTwGTeBuw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nSMy7Vz9toIAs6m24dLgVSpDo12zo2Zpgid0GXKR7ZdYtK22fXqDZfdhgGsor3ZEm
	 QVBEzZtDhO50EaS90m0jYcYdw9GWFQj6Oi2A4f5jW++rDo7LZP+5bZf5gg8t1dzZB8
	 8YIpSYe2m4XaAWBGKiASQZVNdgGpc49rKszRJToKhtlOU3jdPH25ibogZRL/4qpAuG
	 RnzP98PAvtHj96CXvVa9Zq8SA3g8Tpk2Der86RkcHmf83Fjz+LuyGmp1vjfTZvcdod
	 VDyNHRJNcJVB1z29c7wRSWN88t349ScCTnKbOf7jYa7NcXHnpYrPmnEWXMxLnu3S9Z
	 eHBGQx9jbZZ5Q==
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3ecde0be34eso1683265f8f.1
        for <kvm-riscv@lists.infradead.org>; Fri, 17 Oct 2025 02:54:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUdGkl62HQg23BrEBIpctc/mzr8e+zUJQDIGTd7KZ7sYKf8xh/rU94H7yyk5lWKjIkWBZG2QMKTtFQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxEHb/BqhNdgNfWFSXBMMq8MovxY0dHeG5ZdMKuRySjgatJ/LVL
	diSc4qgo+TG5uIJz7pqp+Nea41lGKYFe3k1Ge0BTVMoKDiZ/MxHqWqmXE6gWq1w6sK2Eujjihv0
	1znQyqk7MWRD8VvxymAI4EaPiNIJoSS0=
X-Google-Smtp-Source: AGHT+IHWrBERRiDikiFyahVcvqfNC9E1jn/3Y03EAsRAoR98IYfMEnrhuQ7z+aUULromw32VTBS2YkPTqxGKuCZ57Tw=
X-Received: by 2002:a05:6000:310c:b0:426:d51c:494a with SMTP id
 ffacd0b85a97d-426fb9ac11fmr4831717f8f.24.1760694842381; Fri, 17 Oct 2025
 02:54:02 -0700 (PDT)
MIME-Version: 1.0
References: <20251016012659.82998-1-fangyu.yu@linux.alibaba.com> <CAAhSdy2UcmoPLF0CGBrsF1bRdJe-X05YA7UQOVffxBjZTourMA@mail.gmail.com>
In-Reply-To: <CAAhSdy2UcmoPLF0CGBrsF1bRdJe-X05YA7UQOVffxBjZTourMA@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 17 Oct 2025 17:53:50 +0800
X-Gmail-Original-Message-ID: <CAJF2gTS6FKdXhG3d944B+k8YLRw4JKLEnUtgeC2hDLUjLkhjbg@mail.gmail.com>
X-Gm-Features: AS18NWCPe1Ej6e6BmrPjRcgTihokl613hBi-ZkMtdBKcGiBrCmQW5r-Nein1AIA
Message-ID: <CAJF2gTS6FKdXhG3d944B+k8YLRw4JKLEnUtgeC2hDLUjLkhjbg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Read HGEIP CSR on the correct cpu
To: Anup Patel <anup@brainfault.org>
Cc: fangyu.yu@linux.alibaba.com, atish.patra@linux.dev, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	liujingqi@lanxincomputing.com, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
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

T24gRnJpLCBPY3QgMTcsIDIwMjUgYXQgMjo1OeKAr1BNIEFudXAgUGF0ZWwgPGFudXBAYnJhaW5m
YXVsdC5vcmc+IHdyb3RlOgo+Cj4gT24gVGh1LCBPY3QgMTYsIDIwMjUgYXQgNjo1N+KAr0FNIDxm
YW5neXUueXVAbGludXguYWxpYmFiYS5jb20+IHdyb3RlOgo+ID4KPiA+IEZyb206IEZhbmd5dSBZ
dSA8ZmFuZ3l1Lnl1QGxpbnV4LmFsaWJhYmEuY29tPgo+ID4KPiA+IFdoZW4gZXhlY3V0aW5nIGt2
bV9yaXNjdl92Y3B1X2FpYV9oYXNfaW50ZXJydXB0cywgdGhlIHZDUFUgbWF5IGhhdmUKPiA+IG1p
Z3JhdGVkIGFuZCB0aGUgSU1TSUMgVlMtZmlsZSBoYXZlIG5vdCBiZWVuIHVwZGF0ZWQgeWV0LCBj
dXJyZW50bHkKPiA+IHRoZSBIR0VJUCBDU1Igc2hvdWxkIGJlIHJlYWQgZnJvbSB0aGUgaW1zaWMt
PnZzZmlsZV9jcHUgKCB0aGUgcENQVQo+ID4gYmVmb3JlIG1pZ3JhdGlvbiApIHZpYSBvbl9lYWNo
X2NwdV9tYXNrLCBidXQgdGhpcyB3aWxsIHRyaWdnZXIgYW4KPiA+IElQSSBjYWxsIGFuZCByZXBl
YXRlZCBJUEkgd2l0aGluIGEgcGVyaW9kIG9mIHRpbWUgaXMgZXhwZW5zaXZlIGluCj4gPiBhIG1h
bnktY29yZSBzeXN0ZW1zLgo+ID4KPiA+IEp1c3QgbGV0IHRoZSB2Q1BVIGV4ZWN1dGUgYW5kIHVw
ZGF0ZSB0aGUgY29ycmVjdCBJTVNJQyBWUy1maWxlIHZpYQo+ID4ga3ZtX3Jpc2N2X3ZjcHVfYWlh
X2ltc2ljX3VwZGF0ZSBtYXkgYmUgYSBzaW1wbGUgc29sdXRpb24uCj4gPgo+ID4gRml4ZXM6IDRj
ZWM4OWRiODBiYSAoIlJJU0MtVjogS1ZNOiBNb3ZlIEhHRUlbRXxQXSBDU1IgYWNjZXNzIHRvIElN
U0lDIHZpcnR1YWxpemF0aW9uIikKPiA+IFNpZ25lZC1vZmYtYnk6IEZhbmd5dSBZdSA8ZmFuZ3l1
Lnl1QGxpbnV4LmFsaWJhYmEuY29tPgo+ID4gLS0tCj4gPiAgYXJjaC9yaXNjdi9rdm0vYWlhX2lt
c2ljLmMgfCA4ICsrKysrKy0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vYWlhX2lt
c2ljLmMgYi9hcmNoL3Jpc2N2L2t2bS9haWFfaW1zaWMuYwo+ID4gaW5kZXggZmRhMDM0NmYwZWEx
Li4xNjhjMDJhZDBhNzggMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS9haWFfaW1zaWMu
Ywo+ID4gKysrIGIvYXJjaC9yaXNjdi9rdm0vYWlhX2ltc2ljLmMKPiA+IEBAIC02ODksOCArNjg5
LDEyIEBAIGJvb2wga3ZtX3Jpc2N2X3ZjcHVfYWlhX2ltc2ljX2hhc19pbnRlcnJ1cHQoc3RydWN0
IGt2bV92Y3B1ICp2Y3B1KQo+ID4gICAgICAgICAgKi8KPiA+Cj4gPiAgICAgICAgIHJlYWRfbG9j
a19pcnFzYXZlKCZpbXNpYy0+dnNmaWxlX2xvY2ssIGZsYWdzKTsKPiA+IC0gICAgICAgaWYgKGlt
c2ljLT52c2ZpbGVfY3B1ID4gLTEpCj4gPiAtICAgICAgICAgICAgICAgcmV0ID0gISEoY3NyX3Jl
YWQoQ1NSX0hHRUlQKSAmIEJJVChpbXNpYy0+dnNmaWxlX2hnZWkpKTsKPiA+ICsgICAgICAgaWYg
KGltc2ljLT52c2ZpbGVfY3B1ID4gLTEpIHsKPiA+ICsgICAgICAgICAgICAgICBpZiAoaW1zaWMt
PnZzZmlsZV9jcHUgIT0gc21wX3Byb2Nlc3Nvcl9pZCgpKQo+Cj4gR29vZCBjYXRjaCAhISEKPgo+
IEkgYWdyZWUgd2l0aCBHdW8gUmVuLiBXZSBzaG91bGQgdXNlICJ2Y3B1LT5jcHUiIG92ZXIgaGVy
ZQo+IGluc3RlYWQgb2Ygc21wX3Byb2Nlc3Nvcl9pZCgpLiBBbHNvLCBJIHRoaW5rIHdlIHNob3Vs
ZCBhZGQKPiBzb21lIGNvbW1lbnRzIGZvciBmdXR1cmUgcmVmZXJlbmNlLiBJIHdpbGwgdGFrZSBj
YXJlIG9mIHRoaXMKPiBhdCB0aGUgdGltZSBvZiBtZXJnaW5nIHRoaXMgcGF0Y2guCj4KPiBRdWV1
ZWQgdGhpcyBhcyBmaXhlcyBmb3IgTGludXgtNi4xOApUaHggQW51cCwgdGhlbiBGYW5neXUgbmVl
ZG4ndCB1cGRhdGUgdjIuCgpUaGlzIHBhdGNoIGFsc28gcmV2ZWFscyB0aGUgaWRlYSBvZiBvdXIg
Q1NSX0hHRUlQIGRlc2lnbiAtIFBlci1DUFUgYWNjZXNzLgpBbHRob3VnaCBhcm02NCAmIHg4NiBk
b24ndCBoYXZlIGEgc2ltaWxhciBwcm9ibGVtIGJ5IHVzaW5nIGEgc2hhcmVkCm1lbW9yeSBhZGRy
ZXNzIG1hcCwgaXQgd291bGQgYmUgYSBjb21wbGV4IGh3IGRlc2lnbi4gVGhlIFJJU0MtVgpDU1Jf
SEdFSVAgZGVzaWduIGlzIG11Y2ggc2ltcGxlciBmb3IgaHcsIGFuZCB2Q1BVIG1pZ3JhdGlvbiBv
biB0aGUKcENQVXMgY291bGQgdG9sZXJhdGUgb25lIGFkZGl0aW9uYWwgVk1fZW50ZXIvZXhpdCBj
b3N0IGZvciBhbiBpZGxlCnZjcHUuCgo+Cj4gVGhhbmtzLAo+IEFudXAKPgo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgcmV0ID0gdHJ1ZTsKPiA+ICsgICAgICAgICAgICAgICBlbHNlCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICByZXQgPSAhIShjc3JfcmVhZChDU1JfSEdFSVApICYgQklU
KGltc2ljLT52c2ZpbGVfaGdlaSkpOwo+ID4gKyAgICAgICB9Cj4gPiAgICAgICAgIHJlYWRfdW5s
b2NrX2lycXJlc3RvcmUoJmltc2ljLT52c2ZpbGVfbG9jaywgZmxhZ3MpOwo+ID4KPiA+ICAgICAg
ICAgcmV0dXJuIHJldDsKPiA+IC0tCj4gPiAyLjUwLjEKPiA+CgoKCi0tIApCZXN0IFJlZ2FyZHMK
IEd1byBSZW4KCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3Zt
LXJpc2N2Cg==
