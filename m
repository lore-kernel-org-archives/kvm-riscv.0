Return-Path: <kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5715D39406
	for <kvm-riscv@archiver.kernel.org>; Thu,  2 Apr 2026 10:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Nz8jpk5mi4gQCWApg92rQ1FOlLVxZ3QE2FndNut5Jnc=; b=kd35BEmpTz3DH7
	xDAZd4MhC5GjYYDX50Yia1BLUC8/sbLb2AHGIM/E781R+hQcYnHo5VcT4N9b3D7EnfsOAGFKKHJwz
	yN4WdnJcOB42CQUkc1YVom3nsLroVSs+i+gYJ8QD+zdKO7Q7lakJ1+1XnB8dJOobq3Tehffbnrui1
	9VwDNLlneP00rRdh3xQ3iKAyX9WTfGk4tEHMgKrBExLe7dTNa1Ebxja/5VWn4UMzx8ZT7oPnx/YCA
	inHAFgii30zbXain0EL59JrO0r7jCyuVZNntLwWo0LvIe6xgtKi8GoolXKxw9zXzXK1E9njewNIEB
	X/0G4yFTV8gDoi6mnfyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8FCy-0000000HOoZ-44Pw;
	Thu, 02 Apr 2026 10:23:28 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8FCw-0000000HOoD-3kRL
	for kvm-riscv@lists.infradead.org;
	Thu, 02 Apr 2026 10:23:28 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6327CNdB1128559
	for <kvm-riscv@lists.infradead.org>; Thu, 2 Apr 2026 10:23:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=9NJM49s+MiVY1tQMsPbOJHH10Xogvc7mmpy
	Ts02c6Ms=; b=UlP4958gdS9gDtGGXlkbTIAwReZ8obzELD2H/85Wb9ZPv/YSXr7
	bhVmtqDH1m7FsugU0zpLe2/bHjqLPGfilTh/A2VG4/QuNYEyrcCUBukDdElQrBpz
	2EguKES2Lhn3q/LfSx+tq+8LtQR2SikmyENdnDvusozue9F5cmIUNb6kNdap+3B8
	nZ0j9oZFNh7C0JeVqITCR0jiI4BktJ5D8Px+qLhCoJGVm3INZqHUff0q6hgE/0fz
	cuetOmdYSyRlnCYNC2y302YFVKyR5EvdhTue2NgWhdGG+SRl147r2DrqeRGbApeF
	MmwoywgB/S30uGO8BJjHA20sb0cmqVHo3Mw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d96k9bj1c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <kvm-riscv@lists.infradead.org>; Thu, 02 Apr 2026 10:23:24 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82c714cb672so449481b3a.0
        for <kvm-riscv@lists.infradead.org>; Thu, 02 Apr 2026 03:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775125404; x=1775730204; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9NJM49s+MiVY1tQMsPbOJHH10Xogvc7mmpyTs02c6Ms=;
        b=NplpBkjm8PF5nPtKO8OSxLxeHpLkN6wfa/e4QA6b4v1NdUVCfizP0S1vnvd1FufDXS
         bt9ri2RxdSgXF1zeYitOFgI0aBgeBl30ZWC7c9EV3+o/nzxQZCJx+NRb26HEvk2BW+0E
         7Uyt1HPP1UOvDZR3lv1n1Jf4tp9uC9uRkSeITTP3zFW3A1DTwsZpIIyVDRzLeJZ/FM0j
         XAe8ih4mN7ah9GWKgvLdB87HQ1G2Ekzmj1AONvRLxhPVl+gYIn+LkPsCSIDMkBn3/SEz
         PzOI5v/vTHysqX8UpMQeW3XtvTB/mDm0MOMe6TQS2lAdhOR4SGz5NNFtieYVgE4ZqhxD
         pJeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775125404; x=1775730204;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9NJM49s+MiVY1tQMsPbOJHH10Xogvc7mmpyTs02c6Ms=;
        b=euIM/iThbDO2rUQbvfnEYt+KFcJOQnU7XAEt6HuSgxKrv+fQoumzSgA0w+V5v/vv04
         4taI/KWqEVR5lq/AX6QAnEzts0om7Vq9SRa9nI28DAn6K5DMbo9rGFxbvKvrLX6ArO/j
         WKXgn5L5n2srlfOQdvgohQlcwaCq8mzr5mrpuCfdhNCSgUKA5d6Bqwf9a8HyMnr1ftdf
         E1YSY1n9lnxUxhL7cD1K5Qv2t0JfFiyPkzAjY0WmLwmvazulVI8zIZqZHlj/q2drbWVr
         fn4Mx5Tt9C1D1ibeCwUz3xWg2018WI6b3WstUBWcj+mAMA5LRhQf6ApmUE+K5YXc3Jyz
         W04g==
X-Forwarded-Encrypted: i=1; AJvYcCXOUpg9K+j6XRmDEo1ei3jLBpF2qWNlA0eW+b3hIJYSPk67xL1mMudwZHFBwGMeOJh8ry7C9SNHnQg=@lists.infradead.org
X-Gm-Message-State: AOJu0YxnBGfwFcaO7Bk3lCQ3YOI/A9Egbk4Rl44DWXLsc5TjPEqnSnEK
	Q60QuqJ0Zpde53S7Zg9tkdVwR1tZessVt1gf/tK7KLWHJ0a9uBGplBg7i6y9zLwKB5slKh0+/EM
	4gQufdh4xLx5Xmx88+ofFkdmcBBoEJQajWsLeOeLeTZRVoi/xMYFFBmV79AF0snfcwnuc
X-Gm-Gg: ATEYQzwejcrkM6r+Cmd+8CqqrdS50G23b61ZwKS1rxjW3Z52SqEZKlgNQXKSzAZSwCc
	Slc6iVhdEhN8poDGnO7Dd9CcNMbrOuWWwN8YgXh97rWqeVErW2wN5MVsEI3OfwtzpAhpXwW0dpy
	H+poc8SHRH4qof/mFUinxvdshdDrMW1fzGaQCJTgfRYARoK+yvYUvRgx0Lt/5Dp1b/dZYyT48l1
	HVLTRHHKzOP6jB7N3Az30pdXHzA5kPfXGO0MobaVjbn+by3iQgbonDLbfAytBhqX65vq7ALgwt2
	2/IBEkvd/qH0Dvln+AoW744zkRG2DzRfr3GUGVid7KtuvC5F24IMnF7jGelJUjVqdFdfM6xZIam
	19ArlnOLYoGnSkybTqpDikdap5rnWCUnSPt5H+yd0SCnLh8kp+lJ9yD2s6MA=
X-Received: by 2002:a05:6a00:12e0:b0:82a:1935:f21b with SMTP id d2e1a72fcca58-82ce8b1505fmr6940222b3a.55.1775125404005;
        Thu, 02 Apr 2026 03:23:24 -0700 (PDT)
X-Received: by 2002:a05:6a00:12e0:b0:82a:1935:f21b with SMTP id d2e1a72fcca58-82ce8b1505fmr6940195b3a.55.1775125403534;
        Thu, 02 Apr 2026 03:23:23 -0700 (PDT)
Received: from hu-mchitale-hyd.qualcomm.com ([202.46.22.19])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-82cf9c41bc6sm2643160b3a.29.2026.04.02.03.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 03:23:23 -0700 (PDT)
From: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
To: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
        Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Sean Christopherson <seanjc@google.com>, Marc Zyngier <maz@kernel.org>,
        Oliver Upton <oupton@kernel.org>
Cc: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>, kvm@vger.kernel.org,
        kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] KVM: riscv: selftests: Implement kvm_arch_has_default_irqchip
Date: Thu,  2 Apr 2026 15:48:14 +0530
Message-ID: <20260402101818.2982071-1-mayuresh.chitale@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Authority-Analysis: v=2.4 cv=doLWylg4 c=1 sm=1 tr=0 ts=69ce439c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=wNTC72m251yRgy6-mc0A:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: 9JAfFFNwdr5Bm3ca0j88qzaZ4WwrzusN
X-Proofpoint-GUID: 9JAfFFNwdr5Bm3ca0j88qzaZ4WwrzusN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA5MyBTYWx0ZWRfXwxs1p/CLJmcS
 k3YTr/KhBqMh8Vvmbp2Y+hBtxVMBU/UMLpRTKLbXzKKxijevVZR5Aq7+juSvWoFrWLFlmt7tqrK
 T3hTW01yXwbalRr7+bcBlKfIPul7DH7JjhmG0TR1FDfHvkJnHw822PZwBtCepEw0iLhnw3+YvKR
 LRordJWUfbOo/kf8jAoyhE0E/JCVt/b/pnmCI6DRCFn0S+XApAXvdUOK0/kBqi2inM0a8ddNHvi
 rhBCpSDH6xANOObLoAWaqngVyarf1kRcBAcHH20WY0Qfi4sGIjwExpyB2ye5YYWPRucNeRgFDtg
 9Qwaw9iywjSWUHx2HFHkUeQwkPG/rZVKjNwfc1mcq23+yO3hUIYFfYXpC9+w+N13NgGUn3vle1j
 SSDA+NMqwlTORKvZ90MSeXjwhPjv1VXhkjmHKcvkxTU4LSvlF4oiEY698f06ZhL7jmqPwZjy0iG
 ISUFVhTDNe3DTXVuAwg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0
 clxscore=1011 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020093
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_032327_085978_C88AB98D 
X-CRM114-Status: UNSURE (   9.27  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "kvm-riscv" <kvm-riscv-bounces@lists.infradead.org>
Errors-To: kvm-riscv-bounces+kvm-riscv=archiver.kernel.org@lists.infradead.org

kvm_arch_has_default_irqchip is required for irqfd_test and returns
true if an in-kernel interrupt controller is supported.

Fixes: a133052666bed ("KVM: selftests: Fix irqfd_test for non-x86 architectures")
Signed-off-by: Mayuresh Chitale <mayuresh.chitale@oss.qualcomm.com>
---
 tools/testing/selftests/kvm/lib/riscv/processor.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/testing/selftests/kvm/lib/riscv/processor.c b/tools/testing/selftests/kvm/lib/riscv/processor.c
index 51dd455ff52c..067c6b2c15b0 100644
--- a/tools/testing/selftests/kvm/lib/riscv/processor.c
+++ b/tools/testing/selftests/kvm/lib/riscv/processor.c
@@ -566,3 +566,8 @@ unsigned long riscv64_get_satp_mode(void)
 
 	return val;
 }
+
+bool kvm_arch_has_default_irqchip(void)
+{
+	return kvm_check_cap(KVM_CAP_IRQCHIP);
+}
-- 
2.43.0


-- 
kvm-riscv mailing list
kvm-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/kvm-riscv
