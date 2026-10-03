Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5300CA5FDD
	for <kvm-riscv@archiver.kernel.org>; Sat,  3 Oct 2026 10:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dW1Xi5KJBpLRcpVmgYXpLrRdYek4Dq+1Rj9MOlDToXA=; b=DZSPeUMNmvHfex
	6eBE+xm85yzs/8xbXG+CwWhoyNcJUp9qr5W5mEQI+AdP0htRhK8sOdnX2Ct7XWpe/I1GHxCmMyl9H
	tWfkoCj0yJgFAUDidQ3BZ8gA2LDYsamRCJz1Z4suFiJWxk6Mfy28CoY88U3d8uhs8A81foKbpeerE
	LpIJQbuNxAKrMQgpeYV2pvsjVpl4f4HlzIR/qyqOfzo94FjB6X/NokdIfPG456CYhHYeyDNMDDlj5
	zICDjcxtstlKn79Ge6bfWSuKI4CIJFc7zXhxpPwz/atz345FHqU6kOUROsJGzlZuzkLyhol5GsyEY
	MSkUteLVN1oQVuxrVuHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCwZA-0000000DKiF-1W9w;
	Sat, 03 Oct 2026 10:02:04 +0000
Received: from mail-wr2-x0f.google.com ([2a00:1450:4864:30::f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCwZ7-0000000DKgO-1Oy5
	for kvm-riscv@lists.infradead.org;
	Sat, 03 Oct 2026 10:02:02 +0000
Received: by mail-wr2-x0f.google.com with SMTP id ffacd0b85a97d-48b05fdb2f9so219799f8f.0
        for <kvm-riscv@lists.infradead.org>; Sat, 03 Oct 2026 03:02:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791021719; cv=none;
        d=google.com; s=arc-20260327;
        b=nNnUgwFP+HaYnsfshY4Z62XDtlBDrP4/W6loULfDcimaKbcA2ByEJteVQ3dxOlhcHW
         e180tO63tiphnL9QFRUNLD2Ln+jXnhYMTITUW+zKbE+Bslwbwqo2GInO7EFzaGrpNCpX
         zGfwG074jixslUnii3b1Atvz1e0JWURtGGtumEqVamy1WNyOC9r0BYKQ/slQd6ftGOGa
         uUhiv07pU53wLz0lJwyfJdEciaLshkvLSX5wDtDHLgCPqv9z1C+nksYE88WEGxHmvBg/
         oRYFkojedZSLNt2wYDFICRk2oGbyIJccRS88wzlgtnOlywkFVRbUivQQwAGnWllAzcvU
         /V+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=toFwkFZa1NLpcYuyov6v0MW1/I0mrWgEqkrs2TGLYcE=;
        fh=gzgxix2vY2U7FHBMRk9W8mNYvVGZ6SEqs6SovyNoQSI=;
        b=NefEFKtjO4rawsiQywSvSYWwGaTyJnnerBZg5NhUkoR+MIyy6+W+DWXoxd4Ofa6yCC
         zNlV1jPYWOrq3ik6zASwwy5MY7T1fsEi2rbTUutsb9JIOH4dQqnNB5lgr4zizSg//DCu
         o1kpTXKk7zk8u0yIQ/SsEx3+Bfv0gh2TFQ2TFkWBpclMEiBS1UPrpXL0GTVmgYco7Jp0
         3/aOsRwBwLCtiUYY/a7qNjBpWo4Cf+JejWpB9OSohzWB/VCEKGHkYhrkxo59nuF8hK3E
         5+BzC8YfwjpijlpfwD5YqCvmQo2rsgSqHxJOediBLiImXVstYMYtQlqXPw6matWrbvVd
         x3Jg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1791021719; x=1791626519; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=toFwkFZa1NLpcYuyov6v0MW1/I0mrWgEqkrs2TGLYcE=;
        b=O8+a7Ed5uMDIT16LF25Q6O4xCJplJQPDeKOb4aP6JXXvzfp+coSWc+OPyG06XkwYFR
         EU0JXtIt3BYguaslUU38qQAFVvV4L9xTQj0zi86S01IRKsZQjAiHrHjz2tra5mybbXXZ
         Y6eqIJBIcOkhkniA01MOIpAS4OSycTI8cTLnsHu9tMIV3Bnc7IsIlLrTYIyYe4O+47Hx
         m5fyJUHGw70lMyE4zc5qcyPMMc38ju9ttSix37ZPpD3BQZCO4L8eySSgFCLh7HmGdl6W
         h1Ff/khtsKGNJTdmMA+tjwwkSzjuICQlCxuzM53MaDii1GEoMcWG8SPX1c1dshKfyUVT
         /1qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791021719; x=1791626519;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=toFwkFZa1NLpcYuyov6v0MW1/I0mrWgEqkrs2TGLYcE=;
        b=K3g/E1M0ghsrAnfJ3r/YrrETG0RQT06cQFLc/YcVeLOC5YrD490sLqCPDbbcSGC93z
         DSREj270tqnXp4enxFVep4g33cRWjqkGqb6cBXhMa7jRkmZJB8zFCp/n/60Bn4hqJVhN
         QoUMghc9aHUQ4TD3U2ONKNTWSzGgQtK6ypVvqox+DoKIEjksTtmhg50/Sqya9Nz3dsUW
         EAFWeDXhPAhcJIpfpJMyxfyMumdm9guYovUGVyuRHHVAWzQX4mhW+mPqVxZJjh3moelb
         lZ7dpv7KJglRmf5KZxTm8ZuvrPQw47Ez0vR+my0UulIkylNKIY+HLAS+LI68WBjbzbGb
         lvgQ==
X-Forwarded-Encrypted: i=1; AKwUvByR4nw01MzYMfQ4ApvuGeQxOWDbQxjqJUtdUvkqpiZiUVGQn55qp56cKyfxp4EdbG+MZzxn6B5oBNs=@lists.infradead.org
X-Gm-Message-State: AFq9FYJu7gWk4R6wBC43E3ZUNCl18CszGce3f99mWFww6WVE+FAsKmle
	Py6IlmmXSGwGLLqnfURoB29+nXBvOTOmPgCgAqMq2RFOdtQI9+O+txHdZvpe4zZtevFFQZuAlXS
	HyGViPO0VbtxGwiYl00YVzvicG14QruKm+CdSWz7vpQ==
X-Gm-Gg: AYBFou2zj1NytTRUSmdO9ko5HUzKRCsof1doqMBJgwV4uCGwTUdo43n6/TJs6u4E+Le
	ZfgYLXh0fJNZ0ImN1sxj455ZulgCSuXPa5946CBspIo6R8IWFnJtjWnNtDbhgUQH23Mjm6bPEX4
	4fmFcmNsfQpYXkVousSnKko+PWlbV35Cpm6C1UdioxdK5Dzg37Z4z76VzVgPHplXwJDQM9HZiYQ
	Wd8I1hcTE+6zYtHKMvedk9jg9sWRspSe054aWzTbuXNrIQ3fOTerItAjNiJuEduDYGauXysifVu
	Lv9tuwH2nN6XcheI99VJS1tbV99+D+W7BhvTLoiv020Mkmextfcm3aUUvPCugDrStTnOGtWpggd
	tVM226m7iblDv8WtPWPnM+yLf5c1M5WgZ6fOlN3U+v25th1xVoetwkAuE3jsKrEadaqDldZFdXp
	U=
X-Received: by 2002:adf:e199:0:b0:48a:efee:db70 with SMTP id
 ffacd0b85a97d-48b126c255fmr8787711f8f.7.1791021719467; Sat, 03 Oct 2026
 03:01:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260814114507.583424-1-jinyu.tang@linux.dev> <20260814114507.583424-3-jinyu.tang@linux.dev>
In-Reply-To: <20260814114507.583424-3-jinyu.tang@linux.dev>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 3 Oct 2026 15:31:48 +0530
X-Gm-Features: AclHuK_dkAiQSJCFKF0TsjCXthGT7oWYDuuxVVTi1OVsI6Ecqotq3FhGa4Yyvnw
Message-ID: <CAAhSdy2rj7fV0_Apk79NQqdsTW4-tK1JLo9S7ty3JorfukSVLQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] KVM: selftests: Add RISC-V Sv57 page table indexing
To: Jinyu Tang <jinyu.tang@linux.dev>
Cc: Anup Patel <apatel@ventanamicro.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Atish Patra <atish.patra@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <andrew.jones@oss.qualcomm.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Yong-Xuan Wang <yongxuan.wang@sifive.com>, Nutty Liu <nutty.liu@hotmail.com>, 
	Jinyu Tang <tjytimi@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261003_030201_406851_BCAC761C 
X-CRM114-Status: GOOD (  14.76  )
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

T24gRnJpLCBBdWcgMTQsIDIwMjYgYXQgNToxNuKAr1BNIEppbnl1IFRhbmcgPGppbnl1LnRhbmdA
bGludXguZGV2PiB3cm90ZToKPgo+IFJJU0MtViBzZWxmdGVzdHMgY2FuIGNyZWF0ZSBndWVzdHMg
d2l0aCBmaXZlIHBhZ2UtdGFibGUgbGV2ZWxzLCBmb3IKPiBleGFtcGxlIHdoZW4gdGhlIHNlbGVj
dGVkIGd1ZXN0IG1vZGUgaXMgU3Y1Ny4gVGhlIFJJU0MtViBwYWdlLXRhYmxlCj4gd2Fsa2VyIG9u
bHkgaGFkIGluZGV4IGFycmF5cyBmb3IgbGV2ZWxzIDAgdGhyb3VnaCAzLCBzbwo+IHZpcnRfYXJj
aF9wZ19tYXAoKSBpbmRleGVkIHBhc3QgdGhlIGVuZCBvZiB0aGUgYXJyYXlzIHdoZW4gbGV2ZWwg
NCB3YXMKPiB1c2VkLgo+Cj4gQWRkIHRoZSBtaXNzaW5nIEw0IGluZGV4IG1hc2sgYW5kIHNoaWZ0
IHNvIHNlbGZ0ZXN0cyBjYW4gYnVpbGQgZ3Vlc3QKPiBwYWdlIHRhYmxlcyBmb3IgU3Y1NyBWTXMu
Cj4KPiBSZXZpZXdlZC1ieTogTnV0dHkgTGl1IDxudXR0eS5saXVAaG90bWFpbC5jb20+Cj4gU2ln
bmVkLW9mZi1ieTogSmlueXUgVGFuZyA8amlueXUudGFuZ0BsaW51eC5kZXY+CgpMR1RNLgoKUmV2
aWV3ZWQtYnk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpRdWV1ZWQgdGhpcyBw
YXRjaCBmb3IgTGludXgtNy40CgpUaGFua3MsCkFudXAKCgo+IC0tLQo+ICB0b29scy90ZXN0aW5n
L3NlbGZ0ZXN0cy9rdm0vaW5jbHVkZS9yaXNjdi9wcm9jZXNzb3IuaCB8IDMgKysrCj4gIHRvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9saWIvcmlzY3YvcHJvY2Vzc29yLmMgICAgIHwgMiArKwo+
ICAyIGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL3Rvb2xz
L3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9pbmNsdWRlL3Jpc2N2L3Byb2Nlc3Nvci5oIGIvdG9vbHMv
dGVzdGluZy9zZWxmdGVzdHMva3ZtL2luY2x1ZGUvcmlzY3YvcHJvY2Vzc29yLmgKPiBpbmRleCBl
M2FjZjJhZTk4ODEuLmFiZGUzYzcxYzg5MSAxMDA2NDQKPiAtLS0gYS90b29scy90ZXN0aW5nL3Nl
bGZ0ZXN0cy9rdm0vaW5jbHVkZS9yaXNjdi9wcm9jZXNzb3IuaAo+ICsrKyBiL3Rvb2xzL3Rlc3Rp
bmcvc2VsZnRlc3RzL2t2bS9pbmNsdWRlL3Jpc2N2L3Byb2Nlc3Nvci5oCj4gQEAgLTEyNyw2ICsx
MjcsOSBAQCB2b2lkIHZtX2luc3RhbGxfZXhjZXB0aW9uX2hhbmRsZXIoc3RydWN0IGt2bV92bSAq
dm0sIGludCB2ZWN0b3IsIGV4Y2VwdGlvbl9oYW5kbAo+Cj4gIHZvaWQgdm1faW5zdGFsbF9pbnRl
cnJ1cHRfaGFuZGxlcihzdHJ1Y3Qga3ZtX3ZtICp2bSwgZXhjZXB0aW9uX2hhbmRsZXJfZm4gaGFu
ZGxlcik7Cj4KPiArLyogTDQgaW5kZXggQml0WzU2OjQ4XSAqLwo+ICsjZGVmaW5lIFBHVEJMX0w0
X0lOREVYX01BU0sgICAgICAgICAgICAgICAgICAgIDB4MDFGRjAwMDAwMDAwMDAwMFVMTAo+ICsj
ZGVmaW5lIFBHVEJMX0w0X0lOREVYX1NISUZUICAgICAgICAgICAgICAgICAgIDQ4Cj4gIC8qIEwz
IGluZGV4IEJpdFs0NzozOV0gKi8KPiAgI2RlZmluZSBQR1RCTF9MM19JTkRFWF9NQVNLICAgICAg
ICAgICAgICAgICAgICAweDAwMDBGRjgwMDAwMDAwMDBVTEwKPiAgI2RlZmluZSBQR1RCTF9MM19J
TkRFWF9TSElGVCAgICAgICAgICAgICAgICAgICAzOQo+IGRpZmYgLS1naXQgYS90b29scy90ZXN0
aW5nL3NlbGZ0ZXN0cy9rdm0vbGliL3Jpc2N2L3Byb2Nlc3Nvci5jIGIvdG9vbHMvdGVzdGluZy9z
ZWxmdGVzdHMva3ZtL2xpYi9yaXNjdi9wcm9jZXNzb3IuYwo+IGluZGV4IGRlZDU0MjlmMzQ0OC4u
YjRkNDFhNDA3NTUzIDEwMDY0NAo+IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9s
aWIvcmlzY3YvcHJvY2Vzc29yLmMKPiArKysgYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0v
bGliL3Jpc2N2L3Byb2Nlc3Nvci5jCj4gQEAgLTQzLDYgKzQzLDcgQEAgc3RhdGljIHU2NCBwdGVf
aW5kZXhfbWFza1tdID0gewo+ICAgICAgICAgUEdUQkxfTDFfSU5ERVhfTUFTSywKPiAgICAgICAg
IFBHVEJMX0wyX0lOREVYX01BU0ssCj4gICAgICAgICBQR1RCTF9MM19JTkRFWF9NQVNLLAo+ICsg
ICAgICAgUEdUQkxfTDRfSU5ERVhfTUFTSywKPiAgfTsKPgo+ICBzdGF0aWMgdTMyIHB0ZV9pbmRl
eF9zaGlmdFtdID0gewo+IEBAIC01MCw2ICs1MSw3IEBAIHN0YXRpYyB1MzIgcHRlX2luZGV4X3No
aWZ0W10gPSB7Cj4gICAgICAgICBQR1RCTF9MMV9JTkRFWF9TSElGVCwKPiAgICAgICAgIFBHVEJM
X0wyX0lOREVYX1NISUZULAo+ICAgICAgICAgUEdUQkxfTDNfSU5ERVhfU0hJRlQsCj4gKyAgICAg
ICBQR1RCTF9MNF9JTkRFWF9TSElGVCwKPiAgfTsKPgo+ICBzdGF0aWMgdTY0IHB0ZV9pbmRleChz
dHJ1Y3Qga3ZtX3ZtICp2bSwgZ3ZhX3QgZ3ZhLCBpbnQgbGV2ZWwpCj4gLS0KPiAyLjQzLjAKCi0t
IAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8va3ZtLXJpc2N2Cg==
