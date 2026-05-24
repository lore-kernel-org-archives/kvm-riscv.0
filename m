Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7495BCD5BAB
	for <kvm-riscv@archiver.kernel.org>; Sun, 24 May 2026 05:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zRVY+j/BuVlyZgnfTMk3+FarchKSeb6+kOvpfmRh9JI=; b=0BCkU0fMo0wa74
	ZgbKwRsz/3Cf3yVqlQDO2dObwTxz3fKuCrPuQRUKkm5yeb43BxUUel/S9ZNCltIjOJFV5SxZAr3Kx
	tQK3aXOdJAJ3nEYBZZoSZ3ShRQ+pAuvZC7gZbFRTMlvaygEKJfYU0dPAtt99KfpDF/GRx9bMvfF2E
	sMB92DWulkT6poBATNPj9W83VueUY+2shcqyPPEtwgOGyhYapp/lXm2/AGmcXQpOwhsQHu2EGLUlo
	RCjzNlnQEWkO1Rvg1bUSd7zGxQM5ZfK957ywCjdJj5sVtK4sziV5+si3RG+YVarkHa9PYpR1lZnkb
	Pzh+OtH4b+Ct8LiArkIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wR1Jh-0000000EUM4-33h9;
	Sun, 24 May 2026 05:24:01 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wR1Je-0000000EUL7-1wrJ
	for kvm-riscv@lists.infradead.org;
	Sun, 24 May 2026 05:24:00 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-7de7c57b52cso7689204a34.3
        for <kvm-riscv@lists.infradead.org>; Sat, 23 May 2026 22:23:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779600236; cv=none;
        d=google.com; s=arc-20240605;
        b=Rjr8YtGQ1BFodW604Fzq09feymDkY7OzYCZRWHNP+8yPfT0fGETXVzJSKN6P6cGXng
         l0TSDGokB+Fq0rdd+z2rxTpCmejLgpMARacd3kyZ1DUSEncS9H8pfOuNv0INwjQUHYkJ
         IOx1d3KW/r9Yl+vH6rySGUfM7LHbGOhkyVOggGp+b2p6ON8mCji8WI3rKe1+oXRcm2nU
         nSOZZ0MglEFzFqhQF0U5+MWsur7MlkMhe1ulPnBxLsM7eMF+k72vzMWDaVzss4BZAs9O
         LcVaEj8XH0Jz/FwGieYMfQPv29fsTKnW5V7ZV8ofXeMhXZ21qHBpL2TcocLe2AKFVicZ
         Mjsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TlsDSTzRWDaQ++yneqT1aqZ8P2+n7UdjaBbJTpkbfU0=;
        fh=OHnfSRaCSUlao4ixM1ekfV98HeIgqZo854tXVY7ov3I=;
        b=eREEYyafsEnPu3WvWp2eFvmNiQVi0TIUckp9oVmYVBdXg6baClzteBqT1Y5U4L9DIn
         zcxyuMZjiKGSmBlH7UcIsbxDPevJ2kIeml73g93rxuKNVBl4HKRQHMPwOOX2d6cwFKO2
         rBYB7tuuiQREXKuv3X5PgbyAveLKTw9Rce1J0QpnzR5zzCk5lf4dAJnCFihXy27P0mFz
         ozpaxNucHym+T1Dn3RvL/GRdBZaeUZc7PfUVQxA79WcD6uhqaFpgxyt89hl5X/fOuvMJ
         bGLewNlBRBMVJU1NzPPTjHBd1DhL1xiWyD5LP0v7Lp8fQXcW/fIooO1vPDgYW3Pl24tH
         WlIA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20251104.gappssmtp.com; s=20251104; t=1779600236; x=1780205036; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TlsDSTzRWDaQ++yneqT1aqZ8P2+n7UdjaBbJTpkbfU0=;
        b=gyGMs+cidmPZa4/Xz7UebPQk4iKUpKPp3ymWPwyRcXL3wy6B1eGaA5otorVQovqnKc
         DF3juEULJYnZfitXeJPJeomK/FynZEvsZRIbwkeSOepsxs7esax0xpkQ39crps1vm2mZ
         qZUs0d1aZ32rGZ3v0YGtqDzpKLNuAO/jK/L0DLxV+ZErFn5G55uCMWs7NKHl7+vjIloS
         sF8nBwBru+I4CUq74+Zq4qMnF1MK5v7zItPrWGeFg3sPMse7utc5QVQQ6CMzu0JjAoPR
         hIE6gjCKcNa3YQLb1y0xfgY8mlGdTCfEvmvhIubvTSqXaN70wtB4y7NWZwMC2UOfFrgL
         cqUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779600236; x=1780205036;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TlsDSTzRWDaQ++yneqT1aqZ8P2+n7UdjaBbJTpkbfU0=;
        b=Z4VKuOwyn7LWv3eb6CtiGXv5dysFBA0nrF/MbdykXferNQa4I2YKhcOKZhKyU/Qmiq
         ZapZ66n+VqeGutqglRpsfdM6RD9UDX4Kl1YZHJeePCpZTssuxOKs1cUyXFRHHaetYP+9
         4Y9WsDojjAybg1315o5YycMhp0+609e7uYjq0m0f6BEVkEotoXf7XtAWkt29n5Sae+74
         YSzWFOozAnMeUVC2kzvfM6dfbWk2d8wGKAreWKHizYxDiL2bAi7WAB1YTOyiLvboQVKE
         iZYcHLVzoKh8gx5ccRhGQp4+n5kFPptAuiAJAzep7w0tduy4qDNBLcalfpaidllTwo47
         pIgg==
X-Forwarded-Encrypted: i=1; AFNElJ/oowTYkxYXLTpcxaprlR/Ee5KyOJVKGhr4iDBfj8yP8jhzf0VNQoH8L8iggAoIHNZ9UHUYquPGiNk=@lists.infradead.org
X-Gm-Message-State: AOJu0YyoD4yUrc3/9eE2aFP5c6ohl3QOwmlqWhmrDXAlZ9GH4yDqFaSN
	wr4Kz5WNOczaoJeUo51tCSmtZUJDgjjCDqlCBtY1qTpVNp7fz67gIOmQzVzK7hIu566VzEPHRsG
	i55tYfm4+/h2x+zTYwWmNhng5Ar4pynHBLWjtYpvQ8g==
X-Gm-Gg: Acq92OGU+DZRohkK2dEKJOdS7yQoyzpE4i0Nl3vniOy4rD06s9iYxa/U/RLogkjQ+X2
	TBLdqAJPwTOKzzZtQYWuIpVMk/Pw4K3EgoLfYU6QJRtveUJXXFaM/NpPqQ4czi8ofPed3/05r/W
	Y5sXJPTSlKQqRvcA//XZp0tjPoyMHhCJ5b+n7x1l0IT6prgshv1ExHGMKnLdZOebSUhZ/8HCECs
	xTizzLf/fsQrTSAXCPqlLzpqAKcjbvE7zR8Xv7hmJrlT+jJqt6wqrq9hVG/ivCToqUhlN2TAnT2
	SH16h4s57VdWawnTWw5cEsLeBwUVyvYuMVuZUVG1RZQv0+xfc/ZRJlu3UVHAcRdCaDLw0WPFPnb
	VNacCfqo204y/cKccMfO22Li6NyEAPkg5qz0CIQ==
X-Received: by 2002:a05:6820:809:b0:69d:9b54:8578 with SMTP id
 006d021491bc7-69d9b549206mr1744642eaf.3.1779600236536; Sat, 23 May 2026
 22:23:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260425005916.3321811-1-guoren@kernel.org> <20260425005916.3321811-2-guoren@kernel.org>
In-Reply-To: <20260425005916.3321811-2-guoren@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 24 May 2026 10:53:44 +0530
X-Gm-Features: AVHnY4IC08q9kBcQZP_1G1-2LQgJp4Rcy_GebziaWQmr8stCU9wj261jbCraHkA
Message-ID: <CAAhSdy1E+k3whKm0dpgFO9J6DdMhAv0ojGc9rfPVKTt8zZW_xg@mail.gmail.com>
Subject: Re: [PATCH V2 1/4] RISC-V: KVM: AIA: Make HGEI number and management
 fully per-CPU
To: guoren@kernel.org
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, atish.patra@linux.dev, 
	cp0613@linux.alibaba.com, fangyu.yu@linux.alibaba.com, gaohan@iscas.ac.cn, 
	inochiama@gmail.com, kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, me@ziyao.cc, 
	palmer@dabbelt.com, pjw@kernel.org, tglx@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260523_222358_769059_4148FEF7 
X-CRM114-Status: GOOD (  28.07  )
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

T24gU2F0LCBBcHIgMjUsIDIwMjYgYXQgNjoyOeKAr0FNIDxndW9yZW5Aa2VybmVsLm9yZz4gd3Jv
dGU6Cj4KPiBGcm9tOiAiR3VvIFJlbiAoQWxpYmFiYSBEQU1PIEFjYWRlbXkpIiA8Z3VvcmVuQGtl
cm5lbC5vcmc+Cj4KPiBQcmV2aW91c2x5IHRoZSBudW1iZXIgb2YgSHlwZXJ2aXNvciBHdWVzdCBF
eHRlcm5hbCBJbnRlcnJ1cHQgKEhHRUkpCj4gbGluZXMgd2FzIHN0b3JlZCBpbiBhIHNpbmdsZSBn
bG9iYWwgdmFyaWFibGUgYGt2bV9yaXNjdl9haWFfbnJfaGdlaWAKPiBhbmQgYXNzdW1lZCB0byBi
ZSB0aGUgc2FtZSBmb3IgYWxsIEhBUlRzLiBUaGlzIGFzc3VtcHRpb24gZG9lcyBub3QKPiBob2xk
IG9uIGhldGVyb2dlbmVvdXMgUklTQy1WIFNvQ3Mgd2hlcmUgZGlmZmVyZW50IGNvcmVzIG1heSBl
eHBvc2UKPiBkaWZmZXJlbnQgSEdFSUUgQ1NSIHdpZHRocy4KPgo+IEludHJvZHVjZSBgbnJfaGdl
aWAgZmllbGQgaW50byB0aGUgcGVyLUNQVSBgc3RydWN0IGFpYV9oZ2VpX2NvbnRyb2xgCj4gYW5k
IHByb2JlIHRoZSBhY3R1YWwgc3VwcG9ydGVkIEhHRUkgY291bnQgZm9yIHRoZSBjdXJyZW50IEhB
UlQgaW4KPiBga3ZtX3Jpc2N2X2FpYV9lbmFibGUoKWAgdXNpbmcgdGhlIHN0YW5kYXJkIFJJU0Mt
ViBDU1IgcHJvYmUKPiB0ZWNobmlxdWU6Cj4KPiAgICAgY3NyX3dyaXRlKENTUl9IR0VJRSwgLTFV
TCk7Cj4gICAgIG5yID0gZmxzX2xvbmcoY3NyX3JlYWQoQ1NSX0hHRUlFKSk7Cj4gICAgIGlmIChu
cikKPiAgICAgICAgIG5yLS07Cj4KPiBBbGwgSEdFSSBhbGxvY2F0aW9uLCBmcmVlIGFuZCBkaXNh
YmxlIHBhdGhzIChga3ZtX3Jpc2N2X2FpYV9mcmVlX2hnZWkoKWAsCj4gYGt2bV9yaXNjdl9haWFf
ZGlzYWJsZSgpYCwgZXRjLikgbm93IHVzZSB0aGUgcGVyLUNQVSB2YWx1ZSBpbnN0ZWFkIG9mCj4g
dGhlIGdsb2JhbCBvbmUuCj4KPiBUaGUgZWFybHkgZ2xvYmFsIGBrdm1fcmlzY3ZfYWlhX25yX2hn
ZWlgIGlzIGtlcHQgb25seSBmb3IgZGVjaWRpbmcKPiB3aGV0aGVyIFNHRUkgaW50ZXJydXB0IHJl
Z2lzdHJhdGlvbiBpcyBuZWVkZWQ7IHRoZSByZWFsIHBlci1IQVJUCj4gaW5pdGlhbGl6YXRpb24g
b2YgbG9jayBhbmQgZnJlZV9iaXRtYXAgaXMgbW92ZWQgdG8gZW5hYmxlIHRpbWUuCgpXZSBzaG91
bGQga2VlcCB0aGUgYGt2bV9yaXNjdl9haWFfbnJfaGdlaWAgdG8gaW1wbHkgdHdvIHRoaW5nczoK
MSkgTWluaW11bSBudW1iZXIgb2YgSEdFSSBsaW5lcyBhdmFpbGFibGUgYWNyb3NzIGFsbCBIQVJU
cwoyKSBOb24temVybyBrdm1fcmlzY3ZfYWlhX25yX2hnZWkgbWVhbnMgSEdFSSBpcyBlbmFibGVk
CgpUaGUgUEFUQ0gyIGlzIHJlZHVuZGFudCBhbmQgbXVzdCBiZSBkcm9wZWQuIEkgd2lsbCB0YWtl
IGNhcmUKY2FyZSBvZiB0aGlzIGF0IHRoZSB0aW1lIG9mIG1lcmdpbmcuCgo+Cj4gVGhpcyBtYWtl
cyBLVk0gQUlBIHJvYnVzdCBvbiBiaWcuTElUVExFLXN0eWxlIGFuZCBtdWx0aS12ZW5kb3IKPiBh
c3ltbWV0cmljIHBsYXRmb3Jtcy4KPgo+IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gKEFsaWJhYmEg
REFNTyBBY2FkZW15KSA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4gLS0tCj4gIGFyY2gvcmlzY3Yva3Zt
L2FpYS5jIHwgNDAgKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLQo+ICAx
IGZpbGUgY2hhbmdlZCwgMjQgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRpb25zKC0pCj4KPiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9rdm0vYWlhLmMgYi9hcmNoL3Jpc2N2L2t2bS9haWEuYwo+IGlu
ZGV4IDVlYzUwMzI4ODU1NS4uYTIzNzI5MDUyY2ZiIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yv
a3ZtL2FpYS5jCj4gKysrIGIvYXJjaC9yaXNjdi9rdm0vYWlhLmMKPiBAQCAtMjMsNiArMjMsNyBA
QCBzdHJ1Y3QgYWlhX2hnZWlfY29udHJvbCB7Cj4gICAgICAgICByYXdfc3BpbmxvY2tfdCBsb2Nr
Owo+ICAgICAgICAgdW5zaWduZWQgbG9uZyBmcmVlX2JpdG1hcDsKPiAgICAgICAgIHN0cnVjdCBr
dm1fdmNwdSAqb3duZXJzW0JJVFNfUEVSX0xPTkddOwo+ICsgICAgICAgdW5zaWduZWQgaW50IG5y
X2hnZWk7Cj4gIH07Cj4gIHN0YXRpYyBERUZJTkVfUEVSX0NQVShzdHJ1Y3QgYWlhX2hnZWlfY29u
dHJvbCwgYWlhX2hnZWkpOwo+ICBzdGF0aWMgaW50IGhnZWlfcGFyZW50X2lycTsKPiBAQCAtNDUy
LDcgKzQ1Myw3IEBAIHZvaWQga3ZtX3Jpc2N2X2FpYV9mcmVlX2hnZWkoaW50IGNwdSwgaW50IGhn
ZWkpCj4KPiAgICAgICAgIHJhd19zcGluX2xvY2tfaXJxc2F2ZSgmaGdjdHJsLT5sb2NrLCBmbGFn
cyk7Cj4KPiAtICAgICAgIGlmIChoZ2VpID4gMCAmJiBoZ2VpIDw9IGt2bV9yaXNjdl9haWFfbnJf
aGdlaSkgewo+ICsgICAgICAgaWYgKGhnZWkgPiAwICYmIGhnZWkgPD0gaGdjdHJsLT5ucl9oZ2Vp
KSB7Cj4gICAgICAgICAgICAgICAgIGlmICghKGhnY3RybC0+ZnJlZV9iaXRtYXAgJiBCSVQoaGdl
aSkpKSB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgaGdjdHJsLT5mcmVlX2JpdG1hcCB8PSBC
SVQoaGdlaSk7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgaGdjdHJsLT5vd25lcnNbaGdlaV0g
PSBOVUxMOwo+IEBAIC00ODYsMjEgKzQ4Nyw4IEBAIHN0YXRpYyBpcnFyZXR1cm5fdCBoZ2VpX2lu
dGVycnVwdChpbnQgaXJxLCB2b2lkICpkZXZfaWQpCj4KPiAgc3RhdGljIGludCBhaWFfaGdlaV9p
bml0KHZvaWQpCj4gIHsKPiAtICAgICAgIGludCBjcHUsIHJjOwo+ICsgICAgICAgaW50IHJjOwo+
ICAgICAgICAgc3RydWN0IGlycV9kb21haW4gKmRvbWFpbjsKPiAtICAgICAgIHN0cnVjdCBhaWFf
aGdlaV9jb250cm9sICpoZ2N0cmw7Cj4gLQo+IC0gICAgICAgLyogSW5pdGlhbGl6ZSBwZXItQ1BV
IGd1ZXN0IGV4dGVybmFsIGludGVycnVwdCBsaW5lIG1hbmFnZW1lbnQgKi8KPiAtICAgICAgIGZv
cl9lYWNoX3Bvc3NpYmxlX2NwdShjcHUpIHsKPiAtICAgICAgICAgICAgICAgaGdjdHJsID0gcGVy
X2NwdV9wdHIoJmFpYV9oZ2VpLCBjcHUpOwo+IC0gICAgICAgICAgICAgICByYXdfc3Bpbl9sb2Nr
X2luaXQoJmhnY3RybC0+bG9jayk7Cj4gLSAgICAgICAgICAgICAgIGlmIChrdm1fcmlzY3ZfYWlh
X25yX2hnZWkpIHsKPiAtICAgICAgICAgICAgICAgICAgICAgICBoZ2N0cmwtPmZyZWVfYml0bWFw
ID0KPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEJJVChrdm1fcmlzY3ZfYWlhX25y
X2hnZWkgKyAxKSAtIDE7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgaGdjdHJsLT5mcmVlX2Jp
dG1hcCAmPSB+QklUKDApOwo+IC0gICAgICAgICAgICAgICB9IGVsc2UKPiAtICAgICAgICAgICAg
ICAgICAgICAgICBoZ2N0cmwtPmZyZWVfYml0bWFwID0gMDsKPiAtICAgICAgIH0KPgo+ICAgICAg
ICAgLyogU2tpcCBTR0VJIGludGVycnVwdCBzZXR1cCBmb3IgemVybyBndWVzdCBleHRlcm5hbCBp
bnRlcnJ1cHRzICovCj4gICAgICAgICBpZiAoIWt2bV9yaXNjdl9haWFfbnJfaGdlaSkKPiBAQCAt
NTQ1LDkgKzUzMywyOSBAQCBzdGF0aWMgdm9pZCBhaWFfaGdlaV9leGl0KHZvaWQpCj4KPiAgdm9p
ZCBrdm1fcmlzY3ZfYWlhX2VuYWJsZSh2b2lkKQo+ICB7Cj4gKyAgICAgICBzdHJ1Y3QgYWlhX2hn
ZWlfY29udHJvbCAqaGdjdHJsOwo+ICsKPiAgICAgICAgIGlmICgha3ZtX3Jpc2N2X2FpYV9hdmFp
bGFibGUoKSkKPiAgICAgICAgICAgICAgICAgcmV0dXJuOwo+Cj4gKyAgICAgICBoZ2N0cmwgPSB0
aGlzX2NwdV9wdHIoJmFpYV9oZ2VpKTsKPiArCj4gKyAgICAgICAvKiBGaWd1cmUtb3V0IG51bWJl
ciBvZiBiaXRzIGluIEhHRUlFICovCj4gKyAgICAgICBjc3Jfd3JpdGUoQ1NSX0hHRUlFLCAtMVVM
KTsKPiArICAgICAgIGhnY3RybC0+bnJfaGdlaSA9IGZsc19sb25nKGNzcl9yZWFkKENTUl9IR0VJ
RSkpOwo+ICsgICAgICAgY3NyX3dyaXRlKENTUl9IR0VJRSwgMCk7Cj4gKyAgICAgICBpZiAoaGdj
dHJsLT5ucl9oZ2VpKQo+ICsgICAgICAgICAgICAgICBoZ2N0cmwtPm5yX2hnZWktLTsKCkZvciBj
b21wbGV0bmVzcyBvZiB0aGlzIHBhdGNoLCB3ZSBzaG91bGQgYWxzbyBoYXZlIHRoZSBmb2xsb3dp
bmc6CgogICAgaWYgKGdjKQogICAgICAgIGhnY3RybC0+bnJfaGdlaT0gbWluKCh1bG9uZyloZ2N0
cmwtPm5yX2hnZWksIGdjLT5ucl9ndWVzdF9maWxlcyk7CiAgICBlbHNlCiAgICAgICAgaGdjdHJs
LT5ucl9oZ2VpID0gMDsKCkFsc28sIG92ZXIgaGVyZSB3ZSBzaG91bGQgY2hlY2sgYW5kIHVwZGF0
ZSBrdm1fcmlzY3ZfYWlhX25yX2hnZWkKdG8ga2VlcCBpdCBtaW5pbXVtIGFjY3Jvc3MgSEFSVHM6
CgogIGlmIChoZ2N0cmwtPm5yX2hnZWkgJiYgaGdjdHJsLT5ucl9oZ2VpIDwga3ZtX3Jpc2N2X2Fp
YV9ucl9oZ2VpKQogICAga3ZtX3Jpc2N2X2FpYV9ucl9oZ2VpID0gaGdjdHJsLT5ucl9oZ2VpOwoK
PiArCj4gKyAgICAgICBpZiAoaGdjdHJsLT5ucl9oZ2VpKSB7Cj4gKyAgICAgICAgICAgICAgIGhn
Y3RybC0+ZnJlZV9iaXRtYXAgPSBCSVQoaGdjdHJsLT5ucl9oZ2VpICsgMSkgLSAxOwo+ICsgICAg
ICAgICAgICAgICBoZ2N0cmwtPmZyZWVfYml0bWFwICY9IH5CSVQoMCk7Cj4gKyAgICAgICB9IGVs
c2Ugewo+ICsgICAgICAgICAgICAgICBoZ2N0cmwtPmZyZWVfYml0bWFwID0gMDsKPiArICAgICAg
IH0KPiArCj4gKyAgICAgICByYXdfc3Bpbl9sb2NrX2luaXQoJmhnY3RybC0+bG9jayk7Cj4gKwo+
ICAgICAgICAgY3NyX3dyaXRlKENTUl9IVklDVEwsIGFpYV9odmljdGxfdmFsdWUoZmFsc2UpKTsK
PiAgICAgICAgIGNzcl93cml0ZShDU1JfSFZJUFJJTzEsIDB4MCk7Cj4gICAgICAgICBjc3Jfd3Jp
dGUoQ1NSX0hWSVBSSU8yLCAweDApOwo+IEBAIC01ODgsNyArNTk2LDcgQEAgdm9pZCBrdm1fcmlz
Y3ZfYWlhX2Rpc2FibGUodm9pZCkKPgo+ICAgICAgICAgcmF3X3NwaW5fbG9ja19pcnFzYXZlKCZo
Z2N0cmwtPmxvY2ssIGZsYWdzKTsKPgo+IC0gICAgICAgZm9yIChpID0gMDsgaSA8PSBrdm1fcmlz
Y3ZfYWlhX25yX2hnZWk7IGkrKykgewo+ICsgICAgICAgZm9yIChpID0gMDsgaSA8PSBoZ2N0cmwt
Pm5yX2hnZWk7IGkrKykgewo+ICAgICAgICAgICAgICAgICB2Y3B1ID0gaGdjdHJsLT5vd25lcnNb
aV07Cj4gICAgICAgICAgICAgICAgIGlmICghdmNwdSkKPiAgICAgICAgICAgICAgICAgICAgICAg
ICBjb250aW51ZTsKPiAtLQo+IDIuNDMuMAo+CgpSZWdhcmRzLApBbnVwCgotLSAKa3ZtLXJpc2N2
IG1haWxpbmcgbGlzdAprdm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
