Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BF84606A319
	for <kvm-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 05:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nAHWv6Vw;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NMifBLZB;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Jslo1a9S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OkE/ty7ZpxdE+zeDDYYRgIB/zdERdafySelk+Sz6bUI=; b=nAHWv6Vw3hDesr
	lHgSrXCK1M/aBwqcFRZ0OjvAR3OgNUjJAluyIwB3jsJ0aerp+mJtYBqpEhjUILs4ZMTf2BxPv2QlU
	BpHzQhttuzl0Kb4vxWjI6s0cNf2DtkdormZcJBBXknXTBxxe9Ev6xH1y+Y626Z5cESMkTza9il/c1
	720WhR0shWlmcaF3qvGdXmtkwka0oo10Se+hoFvwe3gJMVE959fv07I3tesXYlQKjTtb6ni6u4lP8
	MjPtar2Iz7UnHxaifX25Ma+UNtz5dCi9a/eq7n6JMFzE0ey7Tlp7AgvXVBrVI8a5adpBWBs2BdDIa
	4/2d/dUzl908r97Z7Hrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJlMq-0000000DOQp-3glN;
	Thu, 22 Oct 2026 05:29:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJlMo-0000000DOPf-2q2O
	for kvm-riscv@lists.infradead.org;
	Thu, 22 Oct 2026 05:29:31 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M3jTNu2477018
	for <kvm-riscv@lists.infradead.org>; Thu, 22 Oct 2026 05:29:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x8nc4lFKIflj0031U24QKhHWYfSWWl9JsVlW+Zb/WiE=; b=NMifBLZBvyNscsIS
	OlUvMCfKkwPCFkBrMlfc7wd2xwjWS83v9cCeScE1nB6BCWn5HCDwe/Tiw8VDEg4d
	+3sqA44Bv5Hy6mnTkOeUqHsMdcfDTWCBgaxzOzveOc1lqCsE3Ea/7YsLgmTzf46M
	z4ryNy9OOwLujW6rFsRP4E5zITTRbakLd1U6cPhRO14HAk/F/nP+goKmIhTfwXZL
	CNpUHfBbQfJYO0RgUCm8iXkBc5jDVCqftFHYhYgHc3VPVC2wMLNhl2jUK4eM7Anv
	y4pEupXJmpgtUeE+3RG9vHFZs7cMiLTtcevvnw0CXLLIi1SlCGltQREdCvY5UzcZ
	csveKw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf0k2m5p4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Thu, 22 Oct 2026 05:29:28 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3662e7a9299so6114257eec.1
        for <kvm-riscv@lists.infradead.org>; Wed, 21 Oct 2026 22:29:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792646968; cv=none;
        d=google.com; s=arc-20260327;
        b=bcFPO24yE82Nbu2680Gy+hr+XjvHGGIsUQnKigkB7mwub6bMkPmqUfV7yEFqsnNykV
         dkz8r9B/OboSLXRe/3X8nS76a8UATPP4DN4CrQRwMNkMyAtKGKxGk22HsqlFEf6Ehuvh
         mkQ9dgrpKaH9l4BUk12bnK2/v7j4MXNFUmDWAybEllsEJACWrkxOTWh0T0+K0d+Ev1tk
         e/YzxMdDQKnr4DZBHLySmLNRuI5dO/T7wMGfw/oRvKY6BLb+ahmJecDV0ZR20DlaFcWJ
         zBdrImVfe5M/A9aNYpPqwh8sf6Sh87WpGQ47UHhtdjwpd9jvY1LYkubCfgPh02iRpLFX
         hmVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=x8nc4lFKIflj0031U24QKhHWYfSWWl9JsVlW+Zb/WiE=;
        fh=s8mwnXGzXKilEB4YVkVYgoGD/2IwZKzAxj62BUFRfiI=;
        b=SNuBFCTEQzD2g4VB70KZaJRNEiGnNMEG6+F78t35y7PbdMihpyZsYb6pfEYXw2tAk2
         be4QYao9P1c4dP6iGgcmzaGbJ1QELzfqFKcXri6WuH7yvhBTQ9EeA54VH807H6WBmqjX
         XvT8gZUdsskwk2x6+laoV340bA/ZGjdvJHrPFDy28ylQX4F0s3fpmHrx3aHX6HpyB0B+
         S6iKCtWb80uNt/1WtEQcWYf7c7vHxsVXxwVAbA+FIrPzUF2CDgpn4LaTuukLtrqS0lSp
         DXe6M8uzD9SyH4avVC2ioAmxxCsGQcknuByMUDBLsWfk0nkWpD1yZ+4wa7otA5skc46J
         TOmQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792646968; x=1793251768; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=x8nc4lFKIflj0031U24QKhHWYfSWWl9JsVlW+Zb/WiE=;
        b=Jslo1a9ShEvPr31MFSHKNWoC/AuqPDpjco+Ehd9kg26I43UyOhS4o1AIRX7LlQRv+p
         4OURL5LrTzDKcl5gxt2ysqyKuVJFU1vRIGXJi180/rCklIWvl2ZHSMa43DjLcYvmYMbo
         /b+PKMsSBUfZgA3GCQE39aCdMK9aR2Hfa4rRTsDbl7djdF4NDiODdBH3R2mXgz5GsQ0I
         Uc5fmXfRHaHxpeI1lppX9jGuMezWJCSl1xTwYLVMH8CDWlNrFJfZvmPbNdJLdRjUSJ0k
         WAHgeNN8pL+6cUjRstUGai9MoLGXzczRkfHXdC6zhBI2mcaiWOUiG8kq2MFu+m1Gs8/z
         SbhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792646968; x=1793251768;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x8nc4lFKIflj0031U24QKhHWYfSWWl9JsVlW+Zb/WiE=;
        b=QiL2zAj3ayLq5q1hRm7Wa8b4FFTSbUsPDN0FfRPZ13WZD+9ZmXrHJpPJFR15bw/5Sx
         vF6YQs7PQBVa3yC/Miwkqiuh3dHGyf6pQYJ+XtxsMu124d4IInkbb+XTPA4S6HadSmsg
         9ht1Nbytz6h4jA4yIvbRzIOlgiWK7GIwWNXlvqFCsmm490auAM7qZXB/id8WajKGaR13
         ZEHExQc6pSvvDmr6DU7P/ZMtYKRitxsKxdzSNZKpS8QFLGx4kkOycTVKHvzuJ1EPUuy5
         f/BfKloBeIT6LfypYvLK+oG6OCkZascsEbPjgHaZqU1rmk6HbVpbnkrc+iZaDlAciBKS
         TMjg==
X-Forwarded-Encrypted: i=1; AKwUvByn4F49QvuScH7cxQdwBx3DMDCdlpQ8ZJCR8m7oXluzdmuzp714UyHadRL1aE4ZsHgiNKSmkmRm7FY=@lists.infradead.org
X-Gm-Message-State: AFq9FYLDFReLUrsiqNME9yvXBHEJjI/6R+Ur+3EVP/Ge8TNlK5AD3plF
	4WtP1XfmRLJUxmrPcYq2Itzzhg3wQYIHv9LdsHEEWatHz57EzuXG3/fF9EwFyhWPHjhHIrck1KS
	z+Ft8aCoqd2mu9F/tpaefQgf0u+68/Fn9ijsAivNKv0vR8Gej8ykxPNrHG/ACDS2w0O50u/Xx+G
	m/yUe3z4fMDC7MrsbQa3Q/4x8VXm2n2PI81n303QqKWcvYs98fI4I=
X-Gm-Gg: AYBFou1CX7+ikGUxYj986y61urRDybPyDmohykFtzgp8crGkgDI+2zOnzFyHI6/wqlv
	/6sHsFK5JOgmxh/Lxsng6lPySKwVrtJPmZJLOh4g+zE3mW1/ISNfmuPavLLrJaZgL7HoTlh7BfA
	kkBF8dvTDN3CHUbn8W4R2o+b7XqW4xUeHa+R5LHcET1Zg0Jzx3Rs0L8z79xLE=
X-Received: by 2002:a05:7301:7a08:b0:368:a679:7fcf with SMTP id 5a478bee46e88-368a679852cmr1863345eec.25.1792646967831;
        Wed, 21 Oct 2026 22:29:27 -0700 (PDT)
X-Received: by 2002:a05:7301:7a08:b0:368:a679:7fcf with SMTP id
 5a478bee46e88-368a679852cmr1863324eec.25.1792646967328; Wed, 21 Oct 2026
 22:29:27 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261001-b4-mmio_load_protect_x0-v1-1-90515d86f201@butz.st>
In-Reply-To: <20261001-b4-mmio_load_protect_x0-v1-1-90515d86f201@butz.st>
From: Anup Patel <anup.patel@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:59:15 +0530
X-Gm-Features: AclHuK_iYzosfJ5Dr7--r4SAxXJKbvTYWI4tQYeVRKuVqR1ywsT80cvntNZ8DOA
Message-ID: <CABBgwmtE4ZX+wAs9aRTeUDGkWtyfgpF_Ou-Kb5UoFXE88zdkog@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: KVM: Don't write MMIO load result to x0
To: Stefan Butz <mail@butz.st>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Paolo Bonzini <pbonzini@redhat.com>, Alexander Graf <graf@amazon.com>,
        Yifei Jiang <jiangyifei@huawei.com>,
        Palmer Dabbelt <palmerdabbelt@google.com>, kvm@vger.kernel.org,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-kernel@vger.kernel.org
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAyMSBTYWx0ZWRfX6KQTTHWTRWCW
 ce27393/9QsX64Pt5s521wQTQAmRXYyqM4StQz+pkkrXaEWWK9DF6UQHMhLXCEbyTfsBQn6y/We
 NKHf1ms4EEx+GJgejyo+IAd+DcBT5Wo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAyMSBTYWx0ZWRfXwrj9w+SOo9mS
 6287KPHsyHF0IcY2omt81pFf67ODlaOOTW12oRrRhsT7/A7KTTPXatTBAaYMj9P9lJbH9ImOTXY
 XEMRTF3WWoCa/w9Q8HmwzSo+EPeQ5i/Z6/xRnpzko7SC4d1iOnjrEEgOcV7vO1gSIbR/AR64ewl
 zv4ylLxwGLBDXqrjJTiRxoRY7hlt8in0X0+JxlByrzlk9IqmLj9GSz9eQW+rkc1TotRqfoP4wUB
 dO17flKvftOSuyZbllI/aI4lQlU2a/oBFM6/TWsxMQQk6N0sFYqgdvRU186JmqvBdMYdCyVUVn1
 PI+acjqwNnb/gpPe90v388f/87bP9aS1d/A8yc6H3UxFKanRdOkzRegtoi5GFPmHdOA0QVBcVbZ
 67TnvDMGZDJJKHv6VN76Ohi58rdZ2Xyt+5haTuKuArLN0jh32BnXSJGytc5GVUfDmztlcmaGOFt
 pKLl0PyztciWNWk13rQ==
X-Proofpoint-ORIG-GUID: GIULq9xHISThJliKBkVwNCjUx5piC-SC
X-Proofpoint-GUID: GIULq9xHISThJliKBkVwNCjUx5piC-SC
X-Authority-Analysis: v=2.4 cv=K/+3jCWI c=1 sm=1 tr=0 ts=6ad99f38 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=W-_n0kkjAAAA:8 a=OiFHV6dps91ajMyZhnoA:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=qeNa2pbTr82C0GpJEZFS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220021
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_222930_821993_9444BE6B 
X-CRM114-Status: GOOD (  17.81  )
X-Spam-Score: -2.8 (--)
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

T24gVGh1LCBPY3QgMSwgMjAyNiBhdCAxOjA14oCvUE0gU3RlZmFuIEJ1dHogPG1haWxAYnV0ei5z
dD4gd3JvdGU6Cj4KPiBBbiBNTUlPIGxvYWQgd2l0aCByZD14MCB3cml0ZXMgdGhlIHJlc3VsdCBp
bnRvIGd1ZXN0X2NvbnRleHQuemVybywKPiB3aGljaCBpcyBuZXZlciBjbGVhcmVkLCBzbyBsYXRl
ciBlbXVsYXRlZCByZWFkcyBvZiB4MCByZXR1cm4gZ2FyYmFnZS4KPgo+IEZpeGVzOiA5ZjcwMTMy
NjUxMTIgKCJSSVNDLVY6IEtWTTogSGFuZGxlIE1NSU8gZXhpdHMgZm9yIFZDUFUiKQo+Cj4gU2ln
bmVkLW9mZi1ieTogU3RlZmFuIEJ1dHogPG1haWxAYnV0ei5zdD4KPiAtLS0KPiBBbiBNTUlPIGxv
YWQgd2l0aCByZD14MCB3cml0ZXMgdGhlIHJlc3VsdCBpbnRvIGd1ZXN0X2NvbnRleHQuemVybywK
PiB3aGljaCBpcyBuZXZlciBjbGVhcmVkLCBzbyBsYXRlciBlbXVsYXRlZCByZWFkcyBvZiB4MCBy
ZXR1cm4gZ2FyYmFnZS4KCkxHVE0uCgpSZXZpZXdlZC1ieTogQW51cCBQYXRlbCA8YW51cEBicmFp
bmZhdWx0Lm9yZz4KClF1ZXVlZCB0aGlzIGZvciBMaW51eC03LjQKClRoYW5rcywKQW51cAoKPiAt
LS0KPiAgYXJjaC9yaXNjdi9rdm0vdmNwdV9pbnNuLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3Yva3ZtL3ZjcHVfaW5zbi5jIGIvYXJjaC9yaXNjdi9rdm0vdmNwdV9pbnNuLmMKPiBpbmRleCBh
ZGJiYjU5YTBmMzYuLjJhOGRjMmI4OGJhOCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2t2bS92
Y3B1X2luc24uYwo+ICsrKyBiL2FyY2gvcmlzY3Yva3ZtL3ZjcHVfaW5zbi5jCj4gQEAgLTY0Nyw3
ICs2NDcsNyBAQCBpbnQga3ZtX3Jpc2N2X3ZjcHVfbW1pb19yZXR1cm4oc3RydWN0IGt2bV92Y3B1
ICp2Y3B1LCBzdHJ1Y3Qga3ZtX3J1biAqcnVuKQo+ICAgICAgICAgdmNwdS0+YXJjaC5tbWlvX2Rl
Y29kZS5yZXR1cm5faGFuZGxlZCA9IDE7Cj4gICAgICAgICBpbnNuID0gdmNwdS0+YXJjaC5tbWlv
X2RlY29kZS5pbnNuOwo+Cj4gLSAgICAgICBpZiAocnVuLT5tbWlvLmlzX3dyaXRlKQo+ICsgICAg
ICAgaWYgKHJ1bi0+bW1pby5pc193cml0ZSB8fCAhKChpbnNuID4+IFNIX1JEKSAmIE1BU0tfUlgp
KQo+ICAgICAgICAgICAgICAgICBnb3RvIGRvbmU7Cj4KPiAgICAgICAgIGxlbiA9IHZjcHUtPmFy
Y2gubW1pb19kZWNvZGUubGVuOwo+Cj4gLS0tCj4gYmFzZS1jb21taXQ6IDcyZDNmY2Y4MDJjNDVk
MDBiMzAwZjI1Yjg0OGE5M2MzYTJiZDdjN2UKPiBjaGFuZ2UtaWQ6IDIwMjYxMDAxLWI0LW1taW9f
bG9hZF9wcm90ZWN0X3gwLTVmNWZjMTFlYTUyYQo+Cj4gQmVzdCByZWdhcmRzLAo+IC0tCj4gU3Rl
ZmFuIEJ1dHogPG1haWxAYnV0ei5zdD4KPgo+CgotLSAKa3ZtLXJpc2N2IG1haWxpbmcgbGlzdApr
dm0tcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2t2bS1yaXNjdgo=
