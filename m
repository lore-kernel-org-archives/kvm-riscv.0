Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5D7606A32D
	for <kvm-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 06:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=okNqOmlK;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault.org header.i=@brainfault.org header.a=rsa-sha256 header.s=google header.b=rQkC8vsH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ls/1HaU0dm4P0bwzH6YPYlHoH58cjsjb7GVTusrukE8=; b=okNqOmlKYDo8L3itcmrmuKbt9U
	pzZl1Cxi+P9b3b+7+UbF4/KHimgTnXWzaXn9TsYJXtwXo+xtSK1OW/HRl2PAZpPU6teNiTRt23Tig
	lsU8RIHSl8BvPLhfA8EhiMuNG4oe3rmxsAz9dABDXIprrjR9NRKNcn8EviMWo8JA8vAZI7nmBuPXe
	qetlJubLahCI+POTI5vJYZyDfx+vqCkXrm88Gz/h84Wq0OsOw77OXLPGPhFS0+IPwaECe+HHRkXI4
	e5st0vPGKAaxuKT2Px3YKfRO+OtLLJagGjbfLLHH2Gtdo0CKsUVcgjQzrqwiqjXhnwh7ZOwltCv4x
	oZ7ZlFlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRkni-0000000BmJ4-063Y;
	Fri, 13 Nov 2026 06:30:18 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRkne-0000000BmHT-01zO
	for kvm-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 06:30:16 +0000
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-3acd239776cso8214591fa.0
        for <kvm-riscv@lists.infradead.org>; Thu, 12 Nov 2026 22:30:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794551412; cv=none;
        d=google.com; s=arc-20260327;
        b=VDKkoSQq1DQcv2XmT9CYrOJAeotoiC9lD2VqdxS9/EhQPxsLYalhCOXhJWJHa7jAej
         BXwy5BQfZVdtRky1GaEjHMlRiUfXFgs5ei4nkUGwXj5syCylWONiljOH8SGFyDKQZGCQ
         LmBbdlzGzSv2N5UI99F/kX4z7Uv2aeqf4dXoDb7oQZ6dLfmiUk+7T3EfWTaHo3s+IlM1
         MwNcttoKomlYsdHU+Bj3f/MlqQnpxh/zlv3eMxe8r25YM4TeJ6i3eHPQvtVjAJ0X6qwx
         kJayz4/kvulzlVEOjYlqvFHx/Jksif6Hx8J0XxXvRPXlE886LUVTljRz0UrEo3ObL4Qx
         HHNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DPecgQc9IrDFB6t3fU9sDhl6pEXoErsugQYzriIpc5g=;
        fh=A1JdFCKKPf1BXUJynXW2ym1P19ClgBs+sVuMo/qTkno=;
        b=bcsXNGcoc6KZMgtOssWZ1Zmd6ZxQR7vzaFLAXPkOcGmPqaUVpsahfJ7tgAIiUY+BVj
         m9nAwKndiGBBOiOkDuvHVSE47OC3Rq5R4+9aL5xPDf3DgP+oYzKsuy6whaBzTXx74TbS
         V7bGpYs1o5CGdf05qsEC7iorUD1ZmwuNoONqSD1WU3q5r283s0547VZO1yz+KEoCbzjR
         PYbbyNkbRBK+ch6KufbeOi++mIhtOSPT11c+bTgG3+RWS7WD9Ns3XluPZeVmds5YxlAf
         CfNLPV37x6eaGtwnSeYS/CvN4f3m0ZAXZ9bbAwTAsUc1YWjrlOT6DEsyyOzJGNgKU7gC
         FwVw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault.org; s=google; t=1794551412; x=1795156212; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DPecgQc9IrDFB6t3fU9sDhl6pEXoErsugQYzriIpc5g=;
        b=rQkC8vsHEaGE5J10DN4ZWryeDp3GUno4TX+ioWa1rjC9C7gctA4Mr/XQB0Aw4FthHs
         X/+LovDSxyz2dGUZQrQTYVrqFgucJHnW9+4hsLKGeF+BNiFxmPZmgUg7CyWVV4ZRz4yT
         MRnUjCfOvUs+xM7jJsJBCBmVE0qgsQNkWyCrrpxX7m/U9oTXAexnKFhQem6itu9FY7jz
         axuROBmp5R85n3Q6S93RT5OQNyRXGmR5mq1q+GHpUVxkokX/+VQKGjx+bKcDBw1zmG2D
         6zEnT8+TYgTEE3VzdCsunKvwhUou2I4RUTHNS966Fir9Oy7mlKFRtTfGBLDWIZiXwmyI
         z4BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794551412; x=1795156212;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DPecgQc9IrDFB6t3fU9sDhl6pEXoErsugQYzriIpc5g=;
        b=OopU162amCg5wDois39h+aFDjM3HAwbHywwn7HSHkDA1OjuvpWDGFH/4dc/bsOWiUG
         BeFAEOHZh0NGB2t/Keo1luTYTfld1ozy3fZwSgzqiF1gyxfBtoeGA6a6lo63R2EaKqH2
         aPNNfKiidqD9vtcPTLG1FdBZsjvvC4uLxDU9m7uB74CZ0dr46b8Rwd86NTy6W2yzdmU6
         icVza+xPyZm3rtVX8fDv+KeR9Eu9HXQNj9tqW3ZoSqYMratP4uq/3UgKY0Al7WsG5UMN
         bSTnle4Q2khy8rwwriigKkLUCRoh94B3fgz8grh4xaYlxBqa5o0PnrRYYFbZ3xnmcJ+z
         6GOw==
X-Gm-Message-State: APuU4Z+ePyILfOoRakjzdNUykhSZs+l3EGSstpfW1sd3W4sLI/tf9+NI
	tWLOO97yt5XlZsg1Jr6xsWJ8gje4eknR9VA4TcPTD7Xg0FJw0AbVwC8KgQ9dqhN2wafmpVH1NVs
	YgE9D+DBzCa0oWtPDX9ZU/+RxNRxeu7vAAc/FdSwbRg==
X-Gm-Gg: AYBFou2cgFBvGRDCwhGp015IYfbOMehF3dSH9zMZ75AhqByJ6sEWMAjXqDDp0Qnq/AA
	54yvEAQ9iyo1tzanAN0RiEzhPvlzXOwfbfvjnScVbq2yE3o+0/SESlqIk+VZD7EQqBelb7NyqXH
	xPcIi75RTtClGb8hId1VJj9hgBwxYB2KawnI9w5UdDU3kENFQbR+BF/XlrzJ7Sy/q6d4HCCvcIO
	mXs69jCAqmchWcLYH5JHb6beUGjAE+pkelUIs7LCxIK7puXhugo8/l8jTyn8zPcvMpEy08LgkFK
	Sy9FcTcwktJXEix9dudA1hQB1erO7CByimAohOnOa4qlWn3/N29ec1lPNOfKMYjLZJN6yoEmFQq
	OrS2PJGUWIGApFdfcFCmbZUL01FtBiom4VeminWjhmjTkTwTPbtWQ3j55kYna5aK9VdPxVGeeGV
	CaEyJ/0GBlWr/ulPlOldDCKl+vYukEFHdkwtifvLkDA5KX/Vw1Mj9YXIFo
X-Received: by 2002:a05:651c:a182:b0:3ad:f0bb:344c with SMTP id
 38308e7fff4ca-3ae2b4cd92dmr4405361fa.10.1794551411872; Thu, 12 Nov 2026
 22:30:11 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261022025248.477832-1-jinyue.li@linux.alibaba.com>
In-Reply-To: <20261022025248.477832-1-jinyue.li@linux.alibaba.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 13 Nov 2026 11:59:59 +0530
X-Gm-Features: AclHuK8NiJX_tgbZANqAwiOjegb650NzlAml5enSgYn0fBkXeJUfWcHpMs2vGKY
Message-ID: <CAAhSdy13okqRhJLCygqZajrwDTa64gJt=SnCcZPRQxRd5E=WKQ@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Fix double free of the split page cache
To: Li Jinyue <jinyue.li@linux.alibaba.com>
Cc: kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	atish.patra@linux.dev, pjw@kernel.org, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, wang.yechao255@zte.com.cn, 
	stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_223014_079025_1CFD53A0 
X-CRM114-Status: GOOD (  20.41  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVGh1LCBPY3QgMjIsIDIwMjYgYXQgODoyMuKAr0FNIExpIEppbnl1ZSA8amlueXVlLmxpQGxp
bnV4LmFsaWJhYmEuY29tPiB3cm90ZToKPgo+IGt2bV9yaXNjdl9tbXVfZnJlZV9wZ2QoKSBmcmVl
cyBwZ2Rfc3BsaXRfcGFnZV9jYWNoZSBhZnRlciBkcm9wcGluZwo+IG1tdV9sb2NrLiBJdCBpcyBy
ZWFjaGVkIGZyb20ga3ZtX2FyY2hfZmx1c2hfc2hhZG93X2FsbCgpLCBpLmUuIGZyb20gdGhlCj4g
TU1VIG5vdGlmaWVyIC0+cmVsZWFzZSgpIGNhbGxiYWNrLCB3aGljaCBjYW4gcnVuIGNvbmN1cnJl
bnRseSBmb3IgdGhlCj4gc2FtZSBWTSBmcm9tIGV4aXRfbW1hcCgpIGFuZCBmcm9tIG1tdV9ub3Rp
Zmllcl91bnJlZ2lzdGVyKCkgaW4KPiBrdm1fZGVzdHJveV92bSgpLiBUaGUgc3RhZ2UtMiB0ZWFy
ZG93biBpcyBzZXJpYWxpemVkIGJ5IG1tdV9sb2NrIGFuZCB0aGUKPiBzZWNvbmQgY2FsbGVyIGZp
bmRzIGt2bS0+YXJjaC5wZ2QgYWxyZWFkeSBjbGVhcmVkLCBidXQgYm90aCBjYWxsZXJzIHRoZW4K
PiBnbyBvbiB0byBmcmVlIHRoZSBjYWNoZSwgYW5kIGt2bV9tbXVfZnJlZV9tZW1vcnlfY2FjaGUo
KSBkb2VzIG5vdAo+IHRvbGVyYXRlIGNvbmN1cnJlbnQgY2FsbGVyczoKPgo+ICAgQlVHOiBLQVNB
TjogZG91YmxlLWZyZWUgaW4ga3ZmcmVlKzB4MjgvMHgzMgo+ICAgLi4uCj4gICAga2ZyZWUrMHhj
NC8weDQyOAo+ICAgIGt2ZnJlZSsweDI4LzB4MzIKPiAgICBrdm1fbW11X2ZyZWVfbWVtb3J5X2Nh
Y2hlKzB4MTc4LzB4MjQ2Cj4gICAga3ZtX3Jpc2N2X21tdV9mcmVlX3BnZCsweDIwZS8weDJiNAo+
ICAgIGt2bV9hcmNoX2ZsdXNoX3NoYWRvd19hbGwrMHgxYS8weDI0Cj4gICAga3ZtX21tdV9ub3Rp
Zmllcl9yZWxlYXNlKzB4MzYvMHg3Ywo+ICAgIF9fbW11X25vdGlmaWVyX3JlbGVhc2UrMHgxODIv
MHg2NmEKPiAgICBleGl0X21tYXArMHg3ZjgvMHg4YzQKPiAgICBtbXB1dCsweDdlLzB4MmZjCj4g
ICAgZG9fZXhpdCsweDU3YS8weDIyYjQKPiAgIC4uLgo+ICAgRnJlZWQgYnkgdGFzayAxNTk1NiBv
biBjcHUgMyBhdCA4OTI2LjEwMzUyNHM6Cj4gICAuLi4KPiAgICBrdm1fbW11X2ZyZWVfbWVtb3J5
X2NhY2hlKzB4MTc4LzB4MjQ2Cj4gICAga3ZtX3Jpc2N2X21tdV9mcmVlX3BnZCsweDIwZS8weDJi
NAo+ICAgIGt2bV9hcmNoX2ZsdXNoX3NoYWRvd19hbGwrMHgxYS8weDI0Cj4gICAga3ZtX21tdV9u
b3RpZmllcl9yZWxlYXNlKzB4MzYvMHg3Ywo+ICAgIG1tdV9ub3RpZmllcl91bnJlZ2lzdGVyKzB4
ZjAvMHgzMjgKPiAgICBrdm1fcHV0X2t2bSsweDMyYS8weDdiOAo+ICAgIGt2bV92bV9yZWxlYXNl
KzB4M2EvMHg1MAo+ICAgIF9fZnB1dCsweDMzMC8weDk3NAo+Cj4gVGhlIGNhY2hlIG9ubHkgZmVl
ZHMgaHVnZSBwYWdlIHNwbGl0dGluZyBmcm9tIFZNIGlvY3Rscywgc28gaXQgZG9lcyBub3QKPiBu
ZWVkIHRvIGJlIHJlbGVhc2VkIHRvZ2V0aGVyIHdpdGggdGhlIHBhZ2UgdGFibGUuIEZyZWUgaXQg
ZnJvbQo+IGt2bV9hcmNoX2Rlc3Ryb3lfdm0oKSBpbnN0ZWFkLCB3aGljaCBydW5zIG9uY2UgYWZ0
ZXIgdGhlIE1NVSBub3RpZmllcgo+IGhhcyBiZWVuIHVucmVnaXN0ZXJlZCwgYXMgYXJtNjQgYW5k
IHg4NiBhbHJlYWR5IGRvLiBUaGUgZXJyb3IgcGF0aCBpbgo+IGt2bV9hcmNoX2luaXRfdm0oKSBp
cyBub3QgYWZmZWN0ZWQgYmVjYXVzZSB0aGUgY2FjaGUgY2Fubm90IGhhdmUgYmVlbgo+IGZpbGxl
ZCBhdCB0aGF0IHBvaW50Lgo+Cj4gRm91bmQgYnkgc3l6a2FsbGVyLgo+Cj4gRml4ZXM6IDZjN2Y3
NWVmMDk2YSAoIlJJU0MtVjogS1ZNOiBBZGQgdGhlIHNwbGl0IHBhZ2UgY2FjaGUgZm9yIGlvY3Rs
IGNvbnRleHQiKQo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnCj4gU2lnbmVkLW9mZi1ieTog
TGkgSmlueXVlIDxqaW55dWUubGlAbGludXguYWxpYmFiYS5jb20+CgpMR1RNLgoKUmV2aWV3ZWQt
Ynk6IEFudXAgUGF0ZWwgPGFudXBAYnJhaW5mYXVsdC5vcmc+CgpRdWV1ZWQgdGhpcyBhcyBmaXgg
Zm9yIExpbnV4LTcuNC1yY1gKClRoYW5rcywKQW51cAoKPiAtLS0KPiAgYXJjaC9yaXNjdi9rdm0v
bW11LmMgfCAyIC0tCj4gIGFyY2gvcmlzY3Yva3ZtL3ZtLmMgIHwgMiArKwo+ICAyIGZpbGVzIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2t2bS9tbXUuYyBiL2FyY2gvcmlzY3Yva3ZtL21tdS5jCj4gaW5kZXggM2U5NTVk
ODA4NzQzLi43NGRlY2UyMmQxNzIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rdm0vbW11LmMK
PiArKysgYi9hcmNoL3Jpc2N2L2t2bS9tbXUuYwo+IEBAIC03OTgsOCArNzk4LDYgQEAgdm9pZCBr
dm1fcmlzY3ZfbW11X2ZyZWVfcGdkKHN0cnVjdCBrdm0gKmt2bSkKPgo+ICAgICAgICAgaWYgKHBn
ZCkKPiAgICAgICAgICAgICAgICAgZnJlZV9wYWdlcygodW5zaWduZWQgbG9uZylwZ2QsIGdldF9v
cmRlcihrdm1fcmlzY3ZfZ3N0YWdlX3BnZF9zaXplKSk7Cj4gLQo+IC0gICAgICAga3ZtX21tdV9m
cmVlX21lbW9yeV9jYWNoZSgma3ZtLT5hcmNoLnBnZF9zcGxpdF9wYWdlX2NhY2hlKTsKPiAgfQo+
Cj4gIHZvaWQga3ZtX3Jpc2N2X21tdV91cGRhdGVfaGdhdHAoc3RydWN0IGt2bV92Y3B1ICp2Y3B1
KQo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2t2bS92bS5jIGIvYXJjaC9yaXNjdi9rdm0vdm0u
Ywo+IGluZGV4IGE5ZjA4M2ZlZWI3Ni4uYTdlMWI1MTgyNTdhIDEwMDY0NAo+IC0tLSBhL2FyY2gv
cmlzY3Yva3ZtL3ZtLmMKPiArKysgYi9hcmNoL3Jpc2N2L2t2bS92bS5jCj4gQEAgLTU0LDYgKzU0
LDggQEAgdm9pZCBrdm1fYXJjaF9kZXN0cm95X3ZtKHN0cnVjdCBrdm0gKmt2bSkKPiAgICAgICAg
IGt2bV9kZXN0cm95X3ZjcHVzKGt2bSk7Cj4KPiAgICAgICAgIGt2bV9yaXNjdl9haWFfZGVzdHJv
eV92bShrdm0pOwo+ICsKPiArICAgICAgIGt2bV9tbXVfZnJlZV9tZW1vcnlfY2FjaGUoJmt2bS0+
YXJjaC5wZ2Rfc3BsaXRfcGFnZV9jYWNoZSk7Cj4gIH0KPgo+ICBpbnQga3ZtX3ZtX2lvY3RsX2ly
cV9saW5lKHN0cnVjdCBrdm0gKmt2bSwgc3RydWN0IGt2bV9pcnFfbGV2ZWwgKmlycWwsCj4KPiBi
YXNlLWNvbW1pdDogYzAzYzFhMTQ1MDdkZmFmOGI4NTZjMjYwOGY5YWMyMTYwMjFmYzIyMgo+IC0t
Cj4gMi4yNS4xCj4KCi0tIAprdm0tcmlzY3YgbWFpbGluZyBsaXN0Cmt2bS1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
a3ZtLXJpc2N2Cg==
